Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCBB423
	for <tools@linux.kernel.org>; Tue, 10 Jan 2023 21:46:37 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id e205so11237717oif.11
        for <tools@linux.kernel.org>; Tue, 10 Jan 2023 13:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ss78ytDowrABcg6IL7pgWoGnFJfrV2aZk5hKKwifTA=;
        b=rrhXasmqwHqMG7VDiV7IKDCnsgnD9IkqGZEGCExPr+MayIVy8CdOM60vg4jo1sBVV9
         SMNGMYLcztkA7XZlADlJaRYhLO0VMettIx+IV/QmG8w/ZfL0j66DzSxmknaEVzcry/yr
         v5K+VYPkE4CJfS1cuzjhm5wzCScD7eqRirKndpaToL4T5m8sm8ZJrEgdVBd1zOPUcakt
         qeulzuiCAIVJH+6DmNfjRjPhp5RorWF1gDuhrnd2QnGFx/6mIQ0inUrUNg1N3c8AMFwd
         LDiMX0ll1frGAFHSTM0G3XGkPbyWI+WwVRJxafHg++FRn9GONCoPEcShzdR1H4y0bQNo
         LEJA==
X-Gm-Message-State: AFqh2koIgq0bo0R70th4D620GZHCm6/iL9DxNsqGHWTmH1zCVLOeBkLx
	1IgDB7UdLfqmVoNfHC33umyW/ftekg==
X-Google-Smtp-Source: AMrXdXuNhjVp5pR9fwj5VF0Av27ro26kxy9qc5p9Fr1e2nEWMmSX+TJFO3yxz84dYqiiBifXd6tvkQ==
X-Received: by 2002:aca:c189:0:b0:35a:6005:3dc5 with SMTP id r131-20020acac189000000b0035a60053dc5mr28429874oif.51.1673387196291;
        Tue, 10 Jan 2023 13:46:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v26-20020a9d605a000000b0066eab2ec808sm6622788otj.1.2023.01.10.13.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 13:46:35 -0800 (PST)
Received: (nullmailer pid 3047300 invoked by uid 1000);
	Tue, 10 Jan 2023 21:46:32 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jan 2023 15:46:08 -0600
Subject: [PATCH b4 2/2] prep: Allow configuration options when
 enrolling/creating branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-prep-opts-v1-2-8e7d7b861849@kernel.org>
References: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
In-Reply-To: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.12-dev

I tried 'b4 prep -c -e v6.2-rc1' thinking I could populate the To/Cc list
and enroll a branch in one step, but got this:

Will collect To: addresses using get_maintainer.pl
Will collect Cc: addresses using get_maintainer.pl
Traceback (most recent call last):
  File "/home/rob/.local/bin/b4", line 33, in <module>
    sys.exit(load_entry_point('b4', 'console_scripts', 'b4')())
  File "/home/rob/proj/b4/b4/command.py", line 359, in cmd
    cmdargs.func(cmdargs)
  File "/home/rob/proj/b4/b4/command.py", line 76, in cmd_prep
    b4.ez.cmd_prep(cmdargs)
  File "/home/rob/proj/b4/b4/ez.py", line 1875, in cmd_prep
    return auto_to_cc()
  File "/home/rob/proj/b4/b4/ez.py", line 1797, in auto_to_cc
    tos, ccs, tag_msg, patches = get_prep_branch_as_patches()
  File "/home/rob/proj/b4/b4/ez.py", line 1113, in get_prep_branch_as_patches
    prefixes = tracking['series'].get('prefixes', list())
KeyError: 'series'

Auto populating the To/Cc list currently has to be run by itself. That's
an unnecessary restriction, and it is useful to do that as part of setting
up a new or existing branch. The same applies to '--force-revision',
'--set-prefixes', and '--edit-cover'.

A side effect is these options will now be silently ignored if given with
other sub-commands (e.g. --show-revision).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 b4/command.py | 13 +++++++------
 b4/ez.py      | 31 ++++++++++++++++---------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/b4/command.py b/b4/command.py
index ccae05d24488..b4a02cef7fc7 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -257,23 +257,24 @@ def setup_parser() -> argparse.ArgumentParser:
 
     # b4 prep
     sp_prep = subparsers.add_parser('prep', help='Work on patch series to submit for mailing list review')
-    spp_g = sp_prep.add_mutually_exclusive_group()
-    spp_g.add_argument('-c', '--auto-to-cc', action='store_true', default=False,
+    sp_prep.add_argument('-c', '--auto-to-cc', action='store_true', default=False,
                        help='Automatically populate cover letter trailers with To and Cc addresses')
+    sp_prep.add_argument('--force-revision', metavar='N', type=int,
+                       help='Force revision to be this number instead')
+    sp_prep.add_argument('--set-prefixes', metavar='PREFIX', nargs='+',
+                       help='Extra prefixes to add to [PATCH] (e.g.: RFC mydrv)')
+
+    spp_g = sp_prep.add_mutually_exclusive_group()
     spp_g.add_argument('-p', '--format-patch', metavar='OUTPUT_DIR',
                        help='Output prep-tracked commits as patches')
     spp_g.add_argument('--edit-cover', action='store_true', default=False,
                        help='Edit the cover letter in your defined $EDITOR (or core.editor)')
     spp_g.add_argument('--show-revision', action='store_true', default=False,
                        help='Show current series revision number')
-    spp_g.add_argument('--force-revision', metavar='N', type=int,
-                       help='Force revision to be this number instead')
     spp_g.add_argument('--compare-to', metavar='vN',
                        help='Display a range-diff to previously sent revision N')
     spp_g.add_argument('--manual-reroll', dest='reroll', default=None, metavar='COVER_MSGID',
                        help='Mark current revision as sent and reroll (requires cover letter msgid)')
-    spp_g.add_argument('--set-prefixes', metavar='PREFIX', nargs='+',
-                       help='Extra prefixes to add to [PATCH] (e.g.: RFC mydrv)')
     spp_g.add_argument('--show-info', action='store_true', default=False,
                        help='Show current series info in a column-parseable format')
 
diff --git a/b4/ez.py b/b4/ez.py
index 1b7e390b7744..35c3e9c07ff6 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -480,7 +480,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         if revision is None:
             revision = 1
         prefixes = list()
-        if cmdargs.set_prefixes and len(prefixes[0].strip()):
+        if cmdargs.set_prefixes:
             prefixes = list(cmdargs.set_prefixes)
         else:
             config = b4.get_main_config()
@@ -1881,12 +1881,6 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
         logger.critical('          Stash or commit them first.')
         sys.exit(1)
 
-    if cmdargs.edit_cover:
-        return edit_cover()
-
-    if cmdargs.auto_to_cc:
-        return auto_to_cc()
-
     if cmdargs.reroll:
         msgid = cmdargs.reroll
         msgs = b4.get_pi_thread_by_msgid(msgid, onlymsgids={msgid}, nocache=True)
@@ -1913,23 +1907,30 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.show_info:
         return show_info()
 
-    if cmdargs.force_revision:
-        return force_revision(cmdargs.force_revision)
-
     if cmdargs.format_patch:
         return format_patch(cmdargs.format_patch)
 
     if cmdargs.compare_to:
         return compare(cmdargs.compare_to)
 
+    if cmdargs.enroll_base or cmdargs.new_series_name:
+        if is_prep_branch():
+            logger.critical('CRITICAL: This appears to already be a b4-prep managed branch.')
+            sys.exit(1)
+
+        start_new_series(cmdargs)
+
+    if cmdargs.force_revision:
+        force_revision(cmdargs.force_revision)
+
     if cmdargs.set_prefixes:
-        return set_prefixes(cmdargs.set_prefixes)
+        set_prefixes(cmdargs.set_prefixes)
 
-    if is_prep_branch():
-        logger.critical('CRITICAL: This appears to already be a b4-prep managed branch.')
-        sys.exit(1)
+    if cmdargs.auto_to_cc:
+        auto_to_cc()
 
-    return start_new_series(cmdargs)
+    if cmdargs.edit_cover:
+        return edit_cover()
 
 
 def cmd_trailers(cmdargs: argparse.Namespace) -> None:

-- 
2.39.0

