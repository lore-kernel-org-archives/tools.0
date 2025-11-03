Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30982C11E9
	for <tools@linux.kernel.org>; Mon,  3 Nov 2025 20:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762202828; cv=none; b=GTr4NfV6ywu3zTv5mWp3kHkRFK+sRhpryEMWGbY9J4SD+TpW33xNr6xoOwebd2dZJwSm2wwvKsNXrfBzNACM8qasxspoByjEOB4Sjqupi7g2caMgk5yAWLHoT2Yg3unx5dfqztmQfKJlNSTOev8M3BxDOmAe7tDNseynGsNums8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762202828; c=relaxed/simple;
	bh=Nle+k4Vvc3xQgzQS4Bj9FbDDDmjCCqVmhQrl2FBtYlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QXOx1TJrLYe8e09JY5ZWlbyeIaPwb12cP/SooxOCxpPJQ7pr57NT5e2qp4kYyN0URuL/z1qjBmPQF3zRMZ86LyZJVt85hbMa9SIAv0yFpAe3XDbPV/4rqzhW3ym5eKuHKQkrDiH5RVuSycNaA2GYhxQaaJ4EMTuoUOCDL/2PQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsEWakZV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsEWakZV"
Received: by smtp.kernel.org (Postfix)
	id 57618C116C6; Mon,  3 Nov 2025 20:47:08 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4045DC4CEE7
	for <tools@kernel.org>; Mon,  3 Nov 2025 20:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4045DC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63e0fa0571fso5471934d50.3
        for <tools@kernel.org>; Mon, 03 Nov 2025 12:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762202826; x=1762807626; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SkUXeT+LoifLwx5yy8cH3O/qDIt1i9+WrgQ/iOzPB3I=;
        b=LsEWakZVWfOqU6h9/tP4R9Y9VUWNOF/2N8Ktw+9dcyAFJBq/erMPF8ex5iv9rvt4DL
         dTueIQmCD45KjMCjqQjTvoD8ReSw+VsSS+a4I2NdvlmNfiha3gnRJJEOcqH5QCEtZ9Qn
         5VRqoenqmir434jc7rd3t7dcOv1vYnW4+3FletkY3mcqtLPzplgjm42AzkMbwEkaG2OA
         zYa1jjquUAIM893pxOKc7XwnTMhw8YPwDJ+1t9WOWsXFN1MYCjpLCAEV8WDGfzbBgcm/
         cJRU7PjIT4vQt557N/UxSQItJcTWJrKR3TdJ8y7S+2Z/BuISl5MRSE9O0BNDsnQZyCYS
         +vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762202826; x=1762807626;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkUXeT+LoifLwx5yy8cH3O/qDIt1i9+WrgQ/iOzPB3I=;
        b=SbvpWV5GwsDVmjhyiQzLU8qZr5oQgH5mvQ0AGD55q6KlvZs9w42K4EbsLqZt5fkLCY
         qHGbRjz0pwOYQMkwQrcBYBQLY1ZA6/Dv8pU4O6MrfESMIZJpwUOZTSX8CYL5BpYzDwda
         u1rHk8O3OK9SEDQaXBBEGxar83l8AkeKO10qXP3v2HXt2IzV9BzBRJbalv1ELW2AI5k0
         QF896E1BVHImkK6T1bEEj+sJM1QVVe33SXqLEDxbr4vSXrCum/G80K5TWrBdW4wvjSv9
         Zd6XwtANPgKyOEm7dJ2hENbdYljJZtN2XshBAorHlm56OPWNd26eD8NIcbx5ODw5crW2
         zOkg==
X-Gm-Message-State: AOJu0YzdLVe4MRNpslYywQJJVi+1TfTbCbqKEe2nKry7+6dVet8Ieo0+
	V8FgtaR+97cBkJXE/CvTC8sjbjvV5uyWf5Nkze8idjvrWkhEJdI2vjVx
X-Gm-Gg: ASbGnct8DFhQExh9nXbDAbhYaw+U5CPybs3HbM4NOXmZh9fJs1ZoKkV31sKIAGbjTAy
	Tl9ltGD3d99m8jvPf4WAMd3p2sx46IKadcReJJpLb9d3s0+hYMSAFHNdrsTcs7eftLVKckJAgjt
	2/NQACY6R/s3PvdGroN6QDp6iJ0Zon0o+UXv0sq+XjoX7/ZSXl3Spgyuny3iNegGNx6xil3rROe
	WgQF6uV9Q1DO0Kkhp2mrrwQWbV6g5Izat0mes3Tyqwuq9nZ66Sf64qxzsDHOUF55s7yfLAo+xvT
	JBR+QGUguyNLN6x4Yk6glXB/OdlFSuRQPs4QF9/GcHenU9YTELkgGM/FcjJzaJvBWoDy/UNiZQH
	t050LCAw+vPMnrxmLPCb1CQxNzHjWExD8Pju09KVAVSSbsNW2VZq7/1nwqMQkjx/0flc2kE4CG+
	eKp+bLJ6YYF/blJmQ/z/rq
X-Google-Smtp-Source: AGHT+IHxhhxeywUglNY1qDxVYLV5vd6QVU2jb7JyhAYhOBGz9olfU4EFu+pRn0q+OxTs98v09hN9ig==
X-Received: by 2002:a05:690c:8e19:b0:786:4f20:9f16 with SMTP id 00721157ae682-7864f20a4d0mr95921417b3.55.1762202826105;
        Mon, 03 Nov 2025 12:47:06 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:56::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78691d90b25sm3974707b3.3.2025.11.03.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:47:05 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 03 Nov 2025 12:46:59 -0800
Subject: [PATCH b4] main: ez: add option to use git notes for prep and send
 commands
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-notes-v1-1-6c5a561e4ba6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMIUCWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNj3bz8ktRiXQNDM2NjIyPjFMNkUyWg2oKi1LTMCrA50UpJJkqxtbU
 Awqtmd1sAAAA=
X-Change-ID: 20251103-notes-01633223d1c5
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.15-dev-8cecf

It can be useful to keep a per-patch changelog using git notes. Allow
git notes to be added to commits during export from the b4 prep and
send commands.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Notes:
    v1:
    - a test note to export with b4

 docs/contributor/prep.rst |  6 ++++++
 docs/contributor/send.rst |  5 +++++
 src/b4/__init__.py        |  6 +++++-
 src/b4/command.py         |  4 ++++
 src/b4/ez.py              | 16 ++++++++++------
 5 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 18c710d..836fb53 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -500,3 +500,9 @@ modifying defaults for some of these flags.
   ``--compare-to``. For example::
 
       b4 prep --compare-to v1 --range-diff-opts "--creation-factor=80 --no-dual-color"
+
+``--notes``
+  Include git notes in the patches when formatting with ``-p``. By default,
+  git notes are not included in patch output. When this flag is enabled,
+  notes from the default ``refs/notes/commits`` ref will be appended after
+  the commit message in each patch.
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index 54ed474..121f2d9 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -324,3 +324,8 @@ Command line flags
 ``--resend V``
   Resend the specified previously sent version.
 
+``--notes``
+  Include git notes in the patches. By default, git notes are not included
+  in patch emails. When this flag is enabled, notes from the default
+  ``refs/notes/commits`` ref will be appended after the commit message in
+  each patch.
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 7689550..89b81c2 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3658,7 +3658,8 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
                          mailfrom: Optional[Tuple[str, str]] = None,
                          extrahdrs: Optional[List[Tuple[str, str]]] = None,
                          ignore_commits: Optional[Set[str]] = None,
-                         limit_committer: Optional[str] = None) -> List[Tuple[str, EmailMessage]]:
+                         limit_committer: Optional[str] = None,
+                         include_notes: bool = False) -> List[Tuple[str, EmailMessage]]:
     gitargs = ['rev-list', '--no-merges', '--reverse']
     if limit_committer:
         gitargs += ['-F', f'--committer={limit_committer}']
@@ -3686,6 +3687,9 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
         if git_check_minimal_version("2.40"):
             showargs.append("--default-prefix")
 
+        if include_notes:
+            showargs.append('--notes')
+
         smcfg = get_sendemail_config()
         if not get_git_bool(str(smcfg.get('mailmap', 'false'))):
             showargs.append('--no-mailmap')
diff --git a/src/b4/command.py b/src/b4/command.py
index 0114197..7974ec1 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -322,6 +322,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Do not use local cache')
     sp_prep.add_argument('--range-diff-opts', default=None, type=str,
                          help='Arguments passed to git range-diff when comparing series')
+    sp_prep.add_argument('--notes', dest='include_notes', action='store_true', default=False,
+                         help='Include git notes in patches')
 
     spp_g = sp_prep.add_mutually_exclusive_group()
     spp_g.add_argument('-p', '--format-patch', metavar='OUTPUT_DIR',
@@ -397,6 +399,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Do not add the cryptographic attestation signature header')
     sp_send.add_argument('--use-web-endpoint', dest='send_web', action='store_true', default=False,
                          help="Force going through the web endpoint")
+    sp_send.add_argument('--notes', dest='include_notes', action='store_true', default=False,
+                         help='Include git notes in patches')
     ag_sendh = sp_send.add_argument_group('Web submission', 'Authenticate with the web submission endpoint')
     ag_sendh.add_argument('--web-auth-new', dest='auth_new', action='store_true', default=False,
                           help='Initiate a new web authentication request')
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 57bc1ca..c649ee0 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1550,7 +1550,7 @@ def rethread(patches: List[Tuple[str, EmailMessage]]) -> None:
 def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtracking: bool = True,
                                prefixes: Optional[List[str]] = None, usebranch: Optional[str] = None,
                                expandprereqs: bool = True,
-                               ) -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], str, List[Tuple[str, EmailMessage]]]:
+                               include_notes: bool = False) -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], str, List[Tuple[str, EmailMessage]]]:
     cover, tracking = load_cover(strip_comments=True, usebranch=usebranch)
 
     if prefixes is None:
@@ -1583,7 +1583,8 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
                                       msgid_tpt=msgid_tpt,
                                       seriests=seriests,
                                       mailfrom=mailfrom,
-                                      ignore_commits=ignore_commits)
+                                      ignore_commits=ignore_commits,
+                                      include_notes=include_notes)
 
     base_commit, _, _, _, shortlog, diffstat = get_series_details(start_commit=start_commit,
                                                                   usebranch=usebranch)
@@ -1772,9 +1773,10 @@ def get_sent_tag_as_patches(tagname: str, revision: int) \
     return alltos, allccs, patches
 
 
-def format_patch(output_dir: str) -> None:
+def format_patch(output_dir: str, include_notes: bool = False) -> None:
     try:
-        _, _, _, patches = get_prep_branch_as_patches(thread=False, movefrom=False, addtracking=False)
+        _, _, _, patches = get_prep_branch_as_patches(thread=False, movefrom=False, addtracking=False,
+                                                       include_notes=include_notes)
     except RuntimeError as ex:
         logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
         sys.exit(1)
@@ -1936,7 +1938,9 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             prefixes = None
 
         try:
-            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(prefixes=prefixes)
+            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(
+                prefixes=prefixes,
+                include_notes=cmdargs.include_notes)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
             sys.exit(1)
@@ -2980,7 +2984,7 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
         return cleanup(cmdargs.cleanup)
 
     if cmdargs.format_patch:
-        return format_patch(cmdargs.format_patch)
+        return format_patch(cmdargs.format_patch, include_notes=cmdargs.include_notes)
 
     if cmdargs.compare_to:
         range_diff_compare(cmdargs.compare_to, range_diff_opts=cmdargs.range_diff_opts)

---
base-commit: a6db3f06ce9836a7fc8921f588452804fc62bed1
change-id: 20251103-notes-01633223d1c5

Best regards,
--  
Daniel Zahka <daniel.zahka@gmail.com>

