/*
   Copyright (c) 2016, The Linux Foundation. All rights reserved.
   Copyright (C) 2016, The CyanogenMod Project
   Copyright (C) 2015, Ketut P. Kumajaya
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>
#include <stdlib.h>

#include <android-base/file.h>
#include <android-base/strings.h>

#include "property_service.h"
#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_msm8916.h"

#define MAX(a, b) (((a) > (b)) ? (a) : (b))

#define ALPHABET_LEN 256
#define KB 1024

#define IMG_PART_PATH "/dev/block/bootdevice/by-name/modem"
#define IMG_VER_STR "QC_IMAGE_VERSION_STRING="
#define IMG_VER_STR_LEN 24
#define IMG_VER_BUF_LEN 255
#define IMG_SZ 32000 * KB    /* MMAP 32000K of modem, modem partition is 64000K */

static char board_id[32];

static void import_kernel_nv(const std::string& key, const std::string& value, bool for_emulator) {

    char board_value[32];
    const char s[2] = ":";
    char *final_value;

    if (key == "board_id") {
	strlcpy(board_value, value.c_str(), sizeof(board_value));
	final_value = strtok(board_value, s);
	strlcpy(board_id, final_value, sizeof(board_id));
    }
}

    char in_str[32], *board_value, *ptr;
    int count = 0;

    // board_id=S88047C1:board_vol=1047620
    // The above string can be broken down into three pieces
    // key should contain "board_id" and value contains "S88047C1:board_vol"

    if (strcmp(key.c_str(), "board_id")) {
	/* not board_id */
    	return;
    }

    strncpy(in_str, value.c_str(), sizeof(in_str));
    if (in_str[0] != '\0') {
	ptr = in_str;
	// delimiter or eol found
	do {
	    if (*ptr == ':') break;
	    if (*ptr == '\0') break;
	    ++count;
	    ++ptr;
	} while (ptr);

	strncpy(board_id, value.c_str(), count);
	board_id[count]='\0';
	ERROR("\n **** READ BOARDID=%s **** \n",board_id);
    }

    return;
}

static void import_entire_kernel_cmdline(bool in_qemu,
                           const std::function<void(const std::string&, bool)>& fn) {
    std::string cmdline;
    android::base::ReadFileToString("/proc/cmdline", &cmdline);
 
    for (const auto& entry : android::base::Split(android::base::Trim(cmdline), " ")) {
        fn(entry, in_qemu);
    }
}

static void import_cmdline(const std::string& name, bool for_emulator)
{
    if(name.empty())
        return;

    std::string::size_type pos = name.find('=');
    std::string value = name.substr(pos + 1);
    if (strstr(name.c_str(),"board_id") != NULL){
        pos = value.find(':');
        board_id = value.substr(0,pos);
    }
}

void init_target_properties()
{
    char modem_version[IMG_VER_BUF_LEN];
    int rc;

    std::string product = property_get("ro.product.name");
    if ((strstr(product.c_str(), "wt88047") == NULL))
        return;

    import_entire_kernel_cmdline(0, import_cmdline);

    if (board_id == "S88047E1") {
        property_set("ro.build.product", "HM2014817");
        property_set("ro.product.device", "HM2014817");
        property_set("ro.product.model", "2014817");
        property_set("ro.product.name", "2014817");
        property_set("ro.telephony.default_network", "9,1");
        property_set("telephony.lteOnCdmaDevice", "0");
    } else if (board_id == "S88047D1") {
        property_set("ro.build.product", "HM2014819");
        property_set("ro.product.device", "HM2014819");
        property_set("ro.product.model", "2014819");
        property_set("ro.product.name", "2014819");
        property_set("ro.telephony.default_network", "9,1");
        property_set("telephony.lteOnCdmaDevice", "0");
    } else if (board_id == "S88047C1") {
        property_set("ro.build.product", "HM2014818");
        property_set("ro.product.device", "HM2014818");
        property_set("ro.product.model", "2014818");
        property_set("ro.product.name", "2014818");
        property_set("ro.telephony.default_network", "9,1");
        property_set("telephony.lteOnCdmaDevice", "0");
        property_set("persist.dbg.volte_avail_ovr", "1");
        property_set("persist.dbg.vt_avail_ovr", "1");
    } else if (board_id == "S88047B2") {
        property_set("ro.build.product", "HM2014821");
        property_set("ro.product.device", "HM2014821");
        property_set("ro.product.model", "2014821");
        property_set("ro.product.name", "2014821");
        property_set("ro.telephony.default_network", "22,1");
        property_set("telephony.lteOnCdmaDevice", "1");
        property_set("persist.radio.sglte.eons_domain", "ps");
    } else if (board_id == "S88047B1") {
        property_set("ro.build.product", "HM2014812");
        property_set("ro.product.device", "HM2014812");
        property_set("ro.product.model", "2014812");
        property_set("ro.product.name", "2014812");
        property_set("ro.telephony.default_network", "22,1");
        property_set("telephony.lteOnCdmaDevice", "1");
        property_set("persist.radio.sglte.eons_domain", "ps");
    } else if ((board_id =="S86047A1") || (board_id == "S86047A1_CD")) {
        property_set("ro.build.product", "HM2014813");
        property_set("ro.product.device", "HM2014813");
        property_set("ro.product.model", "2014813");
        property_set("ro.product.name", "2014813");
        property_set("ro.telephony.default_network", "9,1");
        property_set("telephony.lteOnCdmaDevice", "0");
    } else if ((board_id == "S86047A2") || (board_id == "S86047A2_CD")) {
        property_set("ro.build.product", "HM2014112");
        property_set("ro.product.device", "HM2014112");
        property_set("ro.product.model", "2014112");
        property_set("ro.product.name", "2014112");
        property_set("ro.telephony.default_network", "9,1");
        property_set("telephony.lteOnCdmaDevice", "0");
    } else { /* including S88047A2 and S88047A1 */
        property_set("ro.build.product", "HM2014811");
        property_set("ro.product.device", "HM2014811");
        property_set("ro.product.model", "2014811");
        property_set("ro.product.name", "2014811");
        property_set("ro.telephony.default_network", "9,1");
        property_set("telephony.lteOnCdmaDevice", "0");
    }

    /* Unified description and fingerprint for now */
    property_set("ro.build.description", "wt88047-user 5.1.1 LMY47V V8.2.1.0.LHJMIDL release-keys");
    property_set("ro.build.fingerprint", "Xiaomi/wt88047/wt88047:5.1.1/LMY47V/V8.2.1.0.LHJMIDL:user/release-keys");
}
