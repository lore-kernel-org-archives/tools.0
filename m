Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA05553AA
	for <tools@linux.kernel.org>; Sun, 25 Feb 2024 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708899154; cv=none; b=WLJiXMPrxhvYdsP+r90UM+2jPpG3rmnXP5fYmvCuvLaEVhcZR9uldraehFT9yukSY4afH+gH7NyWzRDYG4fcDgpm4gv6EVv1Y1x9ZEgfZ17u+Or0WS6TwlD4Nfm4YbsdsUdpcEJ0CTdKMT67uvBov/92v73EpXt+st01u6OTBig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708899154; c=relaxed/simple;
	bh=8PUqgE+lBxvx483zkNFCWt/yT5m8GIsmZxOOtm8Bp3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S0iV9XKp4fP2DT3ADpyGlP/cey3xrFHzBoiPxbRU/OAxOqomHdGrng96QPGDhTvrYkTbtAwkek0IJqfw1UlKO94xtxN+LgNbk+yEaENJS/v/0nHO6t9sIvdGdSjLk9bjlQllwAL3e1+a9emQ2cW779129F1ukhKnOccLBU2lOsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVKUEBBi; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVKUEBBi"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78731e444daso191770385a.2
        for <tools@linux.kernel.org>; Sun, 25 Feb 2024 14:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708899151; x=1709503951; darn=linux.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzVdp/RGfVBYCkB26Vry0Uj7/AToKypml1Ymy8iXffo=;
        b=ZVKUEBBizqqVRpEReYIG4giuZekGkIixVESHDGS21ayGwSx4BTh65ea+b2gKA+BMNz
         3W+dRayYNouYGqkXpNy6gSzfYbyjIeZn7f6/xf0ZTAPF7QptSPiXUYTnOgWCbdchnIk9
         vHq36Yvm/ddoYvUfNKilSXU9kkj/Aixc4BuoN4meakJ2a3RndvU7sXcHHaUbT6puIUai
         z1buhIo3nW6YAs9E18eHZ4KLn8o7ZVzu9GKfcxfvyyVS8PPaBDAi+ExQF4k8nHXjeUsP
         vxgidURDVblCicMNyd0B5MjPMrzf4lCodTfcDtGoutR23+CyL6NuIowIO3myraXpuRX8
         8/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708899151; x=1709503951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzVdp/RGfVBYCkB26Vry0Uj7/AToKypml1Ymy8iXffo=;
        b=BNYziMzdXmyOXlY6mqd35sahlTqbjCksWDRkxxyJG9LrSZGz1sFKChrsSq7D73pzEl
         okjf3WyZolOQeaPHNOluPnj2dhTVpCeXrX45U7om1Od2Y8O9UdoID6EqJ1K51I0OfOH1
         /dYDu6NpVDeptu21FpcUyxt4SHo5lhazyipe6DJ558HMyXmLzx4lHc/wzOJvSV6/Jy2O
         P5hcSahCY5Qvk19IhHmWCHhXk9h1jFxIyaE5quK36ucQL92MlkQulUJYv+JpMt72pyu+
         +EnrMNGIi3uuqo39X9E0/aXlnTSDQfxLdxwZzTb0yJnbmTIAi1YKn5rdrT016nAjeHAu
         waiw==
X-Gm-Message-State: AOJu0YzblX5RZaxHC/FmoUAQm2yoxFaumD6/qtpYPV4J8K99vhABNJGS
	0eSrxbudZVPczPm9rLEH8pS2jsosa9pWKrVMux4CrHXDCcYYVYH4JwV45yAM/04=
X-Google-Smtp-Source: AGHT+IHs71bljYZWVoH1+LZ5qsuiPl+RrtJIHEZIkH0cm8l3Xk2gOgTCYUnSFoPYyApRfQ6sEz8PFg==
X-Received: by 2002:a05:620a:88f:b0:787:cda2:198c with SMTP id b15-20020a05620a088f00b00787cda2198cmr2724007qka.0.1708899151540;
        Sun, 25 Feb 2024 14:12:31 -0800 (PST)
Received: from [127.0.0.1] ([2606:6d00:11:ff90:6090:e182:bd61:ebff])
        by smtp.gmail.com with ESMTPSA id d11-20020a05620a136b00b0078726073228sm1847129qkl.26.2024.02.25.14.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 14:12:31 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Sun, 25 Feb 2024 17:12:21 -0500
Subject: [PATCH b4 2/2] ez: allow inserting a range-diff in the
 cover-letter
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-ez-range-diff-cover-letter-v1-2-0df35b63bcf2@gmail.com>
References: <20240225-ez-range-diff-cover-letter-v1-0-0df35b63bcf2@gmail.com>
In-Reply-To: <20240225-ez-range-diff-cover-letter-v1-0-0df35b63bcf2@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.14-dev

Some projects recommend inserting in the cover letter a range-diff
against the previous version when sending subsequent versions of a
series.

Support this convention by recognizing the token '${range_diff}' in the
cover letter template, and automatically invoking 'git range-diff'
against the previous revision when creating the cover letter.

As such, adjust ez.py::compare to allow returning the range-diff output
instead of 'execvp'-ing the command.

Since the range-diff invocation might take some time, only perform it if
the corresponding token is found in the cover letter template.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 docs/config.rst |  1 +
 src/b4/ez.py    | 32 ++++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 8523107..77f70f2 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -406,6 +406,7 @@ Contributor-oriented settings
   * ``${cover}``: the content of the cover letter itself
   * ``${shortlog}``: the ``git shortlog`` output for the series
   * ``${diffstat}``: the ``git diff --stat`` output for the series
+  * ``${range_diff}``: the ``git range-diff`` output against the previous revision of the series
   * ``${base_commit}``: the base commit of the series
   * ``${change_id}``: the change-id of the series
   * ``${signature}``: your signature, either from ``~/.signature`` if found, or from your Git config
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 3bf4e9c..11f4cb2 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -76,6 +76,11 @@ Changes in v${newrev}:
 
 """
 
+DEFAULT_RANGEDIFF_TEMPLATE = """
+Range-diff versus v${oldrev}:
+
+"""
+
 
 def get_auth_configs() -> Tuple[str, str, str, str, str, str]:
     config = b4.get_main_config()
@@ -1242,6 +1247,18 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
         'base_commit': base_commit,
         'signature': b4.get_email_signature(),
     }
+    if cover_template.find('${range_diff}') >= 0:
+        if revision > 1:
+            oldrev = revision - 1
+            rangediff_template = DEFAULT_RANGEDIFF_TEMPLATE
+            rd_tptvals = {
+                'oldrev': oldrev,
+            }
+            range_diff = Template(rangediff_template.lstrip()).safe_substitute(rd_tptvals)
+            range_diff += compare(oldrev, execvp=False)
+            tptvals['range_diff'] = range_diff
+        else:
+            tptvals['range_diff'] = ""
     cover_letter = Template(cover_template.lstrip()).safe_substitute(tptvals)
     # Store tracking info in the header in a safe format, which should allow us to
     # fully restore our work from the already sent series.
@@ -2055,7 +2072,7 @@ def force_revision(forceto: int) -> None:
     store_cover(cover, tracking)
 
 
-def compare(compareto: str) -> None:
+def compare(compareto: str, execvp: bool = True) -> Union[List[str], None]:
     cover, tracking = load_cover()
     # Try the new format first
     tagname, revision = get_sent_tagname(tracking['series']['change-id'], SENT_TAG_PREFIX, compareto)
@@ -2085,10 +2102,17 @@ def compare(compareto: str) -> None:
     lines = b4.git_get_command_lines(None, gitargs)
     curr_end = lines[0]
     grdcmd = ['git', 'range-diff', '%.12s..%.12s' % (prev_start, prev_end), '%.12s..%.12s' % (curr_start, curr_end)]
-    # We exec range-diff and let it take over
     logger.debug('Running %s', ' '.join(grdcmd))
-    os.execvp(grdcmd[0], grdcmd)
-
+    if (execvp):
+        # We exec range-diff and let it take over
+        os.execvp(grdcmd[0], grdcmd)
+    else:
+        ecode, out = b4.git_run_command(None, grdcmd[1:])
+        if ecode:
+            logger.critical('CRITICAL: Could not execute range-diff')
+            sys.exit(1)
+        else:
+            return out
 
 def auto_to_cc() -> None:
     tocmdstr = None

-- 
2.39.1

