Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C11990A7
	for <tools@linux.kernel.org>; Fri, 25 Sep 2026 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340634; cv=pass; b=UutI8aIT44m3UI/0u8o0ZlsS/6dLpZ2EE7yd5etJ/PFfHH1xtGOgh/q6tH8+MeyILVFFvfGhRHexwGK7tSJFXqevuLCda/GSRkcx+u0ib12NceaXn2ePQ4ySKgACk6uwOTZh4C7OTf08j0unHocvVNBrrkFaCtjzFenDjRO3qnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340634; c=relaxed/simple;
	bh=8vx12UHCrTWYAYrJYMSdZJQghE+hRg3S/vRqoa66t98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ce4pUHzM5im7S4o7u/3vLD3NmcTVUL8erXrCNdhB7TPKI3X81Qb1xudDDCpyi31azHeyPEihiGG8UkztfJgGN2quHEuAEn+7ZrM65ZnZL2KruTegH0SbIx8tH1Vt7GwOd84Yrme2ziQNpYsAFdMBYf0iEyMjlat7LKeiC6kzSM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oCPwvm1a; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oCPwvm1a"
Received: by smtp.kernel.org (Postfix)
	id 84DAC1F0089A; Fri, 25 Sep 2026 12:50:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.140
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790340632;
	b=IStSfxS5w/3lLC3XX/O1WnTeWaz7uNN3lA959vWj+Z12OASUN0Nn2BInKJw6i0/iMhBH
	 kzx/LhHViVD4Efks2NTbiuGqCEO4eyFs9LcFb4cnZuJLhBbwxYSUXgbu5pEo+/9K6Lf6r
	 CjjFzL3RQtqVTUw+EodrLwhFEzo3mqSD+6bLInIv1klyiJ+rMm35eT0Y+s3U94h4THrZy
	 Z5AVRInuOu3SfGtIcmQm/kVPTLGp/pS8I7BicaknbwRXNwAXoyn5rbTF+W/EnpLfjthVd
	 q047edIKpVN85yVa/s30MFG8GOxh5UPzbSCmPd2De22+GaJ11xbcPGdpZ76pEamPzKw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790340632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=V+PRl7WY3RfXtVEwvmffp9iIg8Ifhh9+F2FnfWkJdGE=;
	b=R/QUGRwxy6IXycy44DkIIP+0uLDm9D+NWMFjIJ8BbX1YpoqhC0s8sxRymMI/VQzFl1BF
	 arK3VHl2OTzkMncoCxdOtV/TUMOcJmSXLU6OrV/+kychn0z5DqRkAaN5Xlk8g0GPgASOX
	 3kOyqkXJ9bitUduvPf/3Iqu0XrGS/S260Yd5G+WyQ44QkAe8A+sW+MDka0T0ct9KWDPbZ
	 nbm7kPtNVd23jmgSGOxF3+Rk6fc6RbQBvPJbPFXwy8i2a1hMj98vSyffTaIVhBoHYYJ5B
	 MTaPKsJ6SI0vFfkpyNuunPwoCK/gBoinJITtbp5Wd/3Z6Ij6sJL3HuyOf24ri+/HT3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oCPwvm1a;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.140
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF2A41F00899
	for <tools@kernel.org>; Fri, 25 Sep 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oCPwvm1a
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CF2A41F00899
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so5275065e9.1
        for <tools@kernel.org>; Fri, 25 Sep 2026 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790340630; x=1790945430; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+PRl7WY3RfXtVEwvmffp9iIg8Ifhh9+F2FnfWkJdGE=;
        b=oCPwvm1aIb2Mvemee8taucbHk3pkOaRqfRvTaA/BwB/ljKjlZj2D4cuBf8f7DdzrjC
         a2XDnVwH9Sx71YnwC17cf/jFbmEQtd2K4z2MjNXRzeOKKKC/HNq9EL5YJPoJMOkSiW9o
         YpSTbeqI8E9x7M6T7YkI7oTzQUeIGUOM2PbZzxQhhsPRga2kIyxL4Zj/6IRi+Y1G/Epc
         axxWeOU7LVdFkXXNQe04cbGUNeREEVD3Z8KvMwHQFdjWVKuv4QRiCTLgZ4rXdgWUgj1u
         8hWXnXs65/9CqMtzcHRW7Bl62k+MQ/7LLoHx0S0gvStfNFV1B7tHGgExe8eZ6WJzoEcz
         NROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340630; x=1790945430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+PRl7WY3RfXtVEwvmffp9iIg8Ifhh9+F2FnfWkJdGE=;
        b=O0OjMp7w01NDki5SG+HuzdH6Nd6NL+BJfDBlYmSk3Y3y4vC6zEAfmnQ9LNuWYCtIfx
         A37GPmpZnxNh1SojLm7wYhs8fA7AV1m4682py6GAQm7ZFuUvIz2sE6VM2i7vfAzixS9k
         nkwGVHrfWCQr4mHutt1d8/jjEpc9GH/0+yhs2X8QSd+SOxkuy60KlRrrGidvf9z44Kr5
         DufKqGjlLkJR1ebtJESkswX6IEB4sl0K8Zzk+npNdlT6g8cKaPeIr6zf4WxQN1b3h6kJ
         IWq0J8b2gDQf07R+a8leCuOqlP4PoWqdaUgQ82lp/ujL2Lw870CNrbjPMRhvg7QK8cFS
         +8Iw==
X-Gm-Message-State: AFuF++n5UpfRysT546Iu4aGq/+4vh/0EtGDqKp2s1ikkiMiRRgvYVEDY
	2RuWBVvozE0co/ZPQdODvT2j2Af0LblNPGdYMOt5KBJErr4mn00TC+2BU6g9JZjsJOg=
X-Gm-Gg: AYBFou2yeS9cxuMBEBu8ysg7UDiT3GodzVaeJ2P3Q99zBendNJXMfQ3TVVJ72qE+Qte
	JP0j8UyGr77yNQ15Fropq6yYUfTMSCsO9NVPnYNWBdWuCRaoOljfDqiijOMiKkUWQOyPzOS9DJL
	JDsJUaxz4T/3vKFXdZvd+xaYVpNv5N8KBSV5zUN2DF8Z+3we6rN6K9XRB7EeX14yL1s2D6SEX+7
	Dh97k3S08F7rZLDEoAnRpZhZ00tBHtdFIW3Z2Jvr10PXPRQizRsswmcCmSIrMkXEm9FnfIIrYa1
	WN9TwiuKaiZP7TeQI7WXp8zCa+Yb+ak6XWc/WYsFYaGNisExZv29Wl76qQLab5b6Z4hKQRQd0u/
	I+Ex+V/sSvVgV4H6rFysBg2d8u44WuCYzmGYibHO6C8l6tR/2hphxumAAS49/q9ueK1TH3JJlOn
	lwIbxErBDMhpxaUI+RoaxXI20a3RNsFY7ChBZZCs8P3ExEAtrX48yucjcpuYsXJf2KKiU42PJil
	wRHGUh8Nbk9zq9dyrPH
X-Received: by 2002:a05:600c:3155:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-49fe670aa3dmr98799475e9.34.1790340630072;
        Fri, 25 Sep 2026 05:50:30 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff21d6209sm25353055e9.4.2026.09.25.05.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:50:29 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 25 Sep 2026 14:50:26 +0200
Subject: [PATCH b4 1/3] lore: parse per-file modes in get_indexes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-b4-lore-fixes-v1-1-103fd9507e67@baylibre.com>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
In-Reply-To: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

A mode is per-file state, but get_indexes() never reset it between
files.  A file's own mode is taken from its index line only when none
is held yet, so once one file had set a mode, every later file that did
not announce a new one kept it instead of reading its own -- a gitlink
or symlink after a regular file came out as 100644.

Reset it on each 'diff --git', and while there parse 'deleted file mode'
and 'old mode', which were never matched at all, and fix the five-digit
'10644' fallback to 100644.

Assisted-by: claude-fable-5
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 src/b4/__init__.py         | 21 +++++++++++--
 src/tests/test___init__.py | 73 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 584755a556b4..3e9145f4a6a5 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2906,14 +2906,29 @@ class LoreMessage:
         newfile = None
         fmod = None
         for line in diff.split('\n'):
-            if not (line.startswith(('diff ', 'index ', 'new file mode '))):
+            if not (
+                line.startswith(
+                    (
+                        'diff ',
+                        'index ',
+                        'new file mode ',
+                        'deleted file mode ',
+                        'old mode ',
+                    )
+                )
+            ):
                 continue
             matches = re.search(r'^diff\s+--git\s+\w/(.*)\s+\w/(.*)$', line)
             if matches:
                 oldfile = matches.groups()[0]
                 newfile = matches.groups()[1]
+                # mode is per-file state; a value left over from the
+                # previous file must not leak onto this one
+                fmod = None
                 continue
-            matches = re.search(r'^new file mode (\d+)', line)
+            matches = re.search(
+                r'^(?:new file mode|deleted file mode|old mode) (\d+)$', line
+            )
             if matches:
                 fmod = matches.groups()[0]
             matches = re.search(r'^index\s+([\da-f]+)\.\.[\da-f]+.*$', line)
@@ -2925,7 +2940,7 @@ class LoreMessage:
                         fmod = matches.groups()[0]
                 if not fmod:
                     # fall back if we can't figure it out
-                    fmod = '10644'
+                    fmod = '100644'
                 indexes.add((oldfile, ohash, newfile, fmod))
         return indexes
 
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 11504bba02c8..980082e26a49 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1808,3 +1808,76 @@ class TestUnicodeControlChars:
     def test_plain_ascii_body_is_not_flagged(self) -> None:
         lmsg = self._get_lmsg('This adds a fancy widget.')
         lmsg.get_am_message(add_trailers=False)
+
+
+class TestGetIndexesPerFileModes:
+    """A mode belongs to the file whose diff header carried it.
+
+    make_fake_am_range() binds every preimage by (hash, mode), so a mode
+    read off the file before it binds a gitlink or a symlink as a regular
+    blob, and the series stops fake-am'ing at all.
+    """
+
+    def test_a_mode_does_not_leak_onto_the_next_file(self) -> None:
+        """A gitlink and a symlink after a regular file keep their own.
+
+        The deleted file states its mode nowhere but on its own
+        "deleted file mode" line, which the index line does not repeat.
+        """
+        diff = (
+            'diff --git a/README b/README\n'
+            'index 1111111..2222222 100644\n'
+            '--- a/README\n'
+            '+++ b/README\n'
+            '@@ -1 +1 @@\n'
+            '-readme\n'
+            '+readme v2\n'
+            'diff --git a/sub b/sub\n'
+            'index 3333333..4444444 160000\n'
+            '--- a/sub\n'
+            '+++ b/sub\n'
+            '@@ -1 +1 @@\n'
+            '-Subproject commit 3333333333333333333333333333333333333333\n'
+            '+Subproject commit 4444444444444444444444444444444444444444\n'
+            'diff --git a/link b/link\n'
+            'index 5555555..6666666 120000\n'
+            '--- a/link\n'
+            '+++ b/link\n'
+            '@@ -1 +1 @@\n'
+            '-README\n'
+            '+sub\n'
+            'diff --git a/gone b/gone\n'
+            'deleted file mode 100755\n'
+            'index 7777777..0000000\n'
+            '--- a/gone\n'
+            '+++ /dev/null\n'
+            '@@ -1 +0,0 @@\n'
+            '-#!/bin/sh\n'
+        )
+        assert b4.LoreMessage.get_indexes(diff) == {
+            ('README', '1111111', 'README', '100644'),
+            ('sub', '3333333', 'sub', '160000'),
+            ('link', '5555555', 'link', '120000'),
+            ('gone', '7777777', 'gone', '100755'),
+        }
+
+    def test_a_mode_change_names_the_preimage_mode(self) -> None:
+        """A chmod alongside an edit: the index line carries no mode.
+
+        get_indexes describes the preimage, so "old mode" is the answer --
+        and nothing anywhere is mode 10644.
+        """
+        diff = (
+            'diff --git a/run.sh b/run.sh\n'
+            'old mode 100644\n'
+            'new mode 100755\n'
+            'index 8888888..9999999\n'
+            '--- a/run.sh\n'
+            '+++ b/run.sh\n'
+            '@@ -1 +1 @@\n'
+            '-echo old\n'
+            '+echo new\n'
+        )
+        assert b4.LoreMessage.get_indexes(diff) == {
+            ('run.sh', '8888888', 'run.sh', '100644')
+        }

-- 
2.55.0

