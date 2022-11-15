Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB13C8ABA;
	Tue, 15 Nov 2022 20:18:00 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5FF9720004;
	Tue, 15 Nov 2022 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668543478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PLz9m1w6kjPUspj+fiG6rIEsDieaFLsuHz3Pp/OjyG0=;
	b=LDp9gKotxiDENxxpn/G9wWzjLFw0pYQMOWGW1+mf2vc16cxeo1Ii6LvJPcHOlEqed3U63X
	E/Ae+AhKssZr7kMzAnV+Fi85aBDul0c+PobqRj37d6c/1/PWjj/gcNOX/6gcUT9zMYA3jW
	/EztPMC0BeD4AAZV2I/8tK8E4jT0KU290zNc2gnsdzW3NucrFxoHCJcFUcbvxtI320fKZl
	hTw12z58hW8vbxS+y+u8GklRc/GooUIwkvFpHyfcya13eoaLQnXIDH1TyYPTx7qnRiDZxv
	YyaYr7WWp8uJq7AEChuoyOE+gVD0MUt5LYAcf1PeqtVP0Dl6OK1dgVQ85TuTpg==
Date: Tue, 15 Nov 2022 21:17:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: b4 patch subject issue
Message-ID: <Y3Pz9Y9Mn1FtnqR1@mail.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Konstantin,

I found a small issue in how b4 handles path subjects:

linux$ b4 shazam -tsl 5640233.DvuYhMxLoT@kreacher
Grabbing thread from lore.kernel.org/all/5640233.DvuYhMxLoT%40kreacher/t.mbox.gz
Checking for newer revisions on https://lore.kernel.org/all/
Analyzing 9 messages in the thread
Checking attestation on all messages, may take a moment...
---
  [PATCH v2 1/5] rtc: rtc-cmos: Call cmos_wake_setup() from cmos_do_probe()
    + Reviewed-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Tested-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (✓ DKIM/intel.com)
    + Link: https://lore.kernel.org/r/4803444.31r3eYUQgx@kreacher
    + Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
  [PATCH v2 2/5] rtc: rtc-cmos: Call rtc_wake_setup() from cmos_do_probe()
    + Reviewed-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Tested-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (✓ DKIM/intel.com)
    + Link: https://lore.kernel.org/r/2143522.irdbgypaU6@kreacher
    + Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
  [PATCH v2 3/5] rtc: rtc-cmos: Eliminate forward declarations of some functions
    + Reviewed-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Tested-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (✓ DKIM/intel.com)
    + Link: https://lore.kernel.org/r/13157911.uLZWGnKmhe@kreacher
    + Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
  [PATCH v2 4/5] rtc: rtc-cmos: Rename ACPI-related functions
    + Reviewed-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Tested-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (✓ DKIM/intel.com)
    + Link: https://lore.kernel.org/r/3225614.44csPzL39Z@kreacher
    + Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
  [PATCH v2 5/5] rtc: rtc-cmos: Disable ACPI RTC event on removal
    + Reviewed-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Tested-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
    + Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (✓ DKIM/intel.com)
    + Link: https://lore.kernel.org/r/2224609.iZASKD2KPV@kreacher
    + Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Total patches: 5
---
Applying: rtc: rtc-cmos: Call cmos_wake_setup() from cmos_do_probe()
Applying: rtc: rtc-cmos: Call rtc_wake_setup() from cmos_do_probe()
Applying: rtc: rtc-cmos:
Applying: rtc: rtc-cmos: Rename ACPI-related functions
Applying: rtc: rtc-cmos: Disable ACPI RTC event on removal
---
Patchwork: setting state on patchwork.ozlabs.org/rtc-linux
 -> under-review : [v2,1/5] rtc: rtc-cmos: Call cmos_wake_setup() from cmos_do_probe()
 -> under-review : [v2,2/5] rtc: rtc-cmos: Call rtc_wake_setup() from cmos_do_probe()
 -> under-review : [v2,3/5] rtc: rtc-cmos: Eliminate forward declarations of some functions
 -> under-review : [v2,4/5] rtc: rtc-cmos: Rename ACPI-related functions
 -> under-review : [v2,5/5] rtc: rtc-cmos: Disable ACPI RTC event on removal
linux$ git log --oneline -5
dfe59ef27467 (HEAD -> plop) rtc: rtc-cmos: Disable ACPI RTC event on removal
f02e8f979e26 rtc: rtc-cmos: Rename ACPI-related functions
a9f73fde7380 rtc: rtc-cmos:
70258aa62244 rtc: rtc-cmos: Call rtc_wake_setup() from cmos_do_probe()
1c399f3090f7 rtc: rtc-cmos: Call cmos_wake_setup() from cmos_do_probe()

For some reason, 3/5 is losing its full subject. I didn't investigate
but I'm using a freshly updated b4 0.10.1 on fedora.

Let me know if I can be of any assistance to debug that.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
