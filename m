Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B519B5A3
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 01:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771981328; cv=none; b=f3XDkL0/uqMq8LJSqHOYA1MVCAB7dwJpaxx8KKkw9tC3cSiV9T2xUFoVQWhmebHXxm7hnIbYCBqwaoNBP/YI+XCYgyo7BvUO3DCk9NvW0AT2NjpAiufhg49NiAVZWv2HYWMyKFl3we+qOIoDdsKpIXKj4sjVThqdcROltV0ZJs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771981328; c=relaxed/simple;
	bh=RftIX+0Fr8JoM3xgNPdsysCg+D8aP6ni1cAd6U4YIKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hX0pGVH7DMTgVABExTCMplW/CvuXDXQtUVhNvXtmMQuYlbviUEBwNTlq3IobsxyaoltZ5ofdN2b5Tm3r3pAS2MyK0Zm6uwGfl4YDgoQJuVxwZPZVTzBiQ9icplcF5iV4O7+5Gcp4BAUUX2kf25oav66eEGKREcQ1ze1mPebzSfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJHzr0W+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJHzr0W+"
Received: by smtp.kernel.org (Postfix)
	id 0AF8AC19423; Wed, 25 Feb 2026 01:02:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61CC3C116D0
	for <tools@kernel.org>; Wed, 25 Feb 2026 01:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61CC3C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771981326; x=1803517326;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=RftIX+0Fr8JoM3xgNPdsysCg+D8aP6ni1cAd6U4YIKs=;
  b=iJHzr0W+k4bC4Z/CGAEpKGqVNwJyaT+K8X8uRPsdDPTBLI/+UyTtREvW
   de503615YwMxHHTqM9htkCt+oz1VnTC97S5fRzUCmZLGNGJfkyUiaG6Ox
   YYphf6qvJtIGGISk2EsznvOGxKQVSUf3oqvh7alsLdCAn8P2wy8z7X4LB
   KX9EQ8H+nWIesbuOv9b9KctsngR+Xwn0CCpWTck9GKHW9ZXJ2X447HppE
   sLRfpljrtwWGSmJ9cGBt1DYrFscb1BuLC8EQr0SNLfE+2VNELHCQEt+qg
   oyFutJrXCkrTfMewZ6czSJUmsBvLdcqoc34mSn/IM8qKVibRjMsHZ25h+
   A==;
X-CSE-ConnectionGUID: iRm70GBSQHC5zM+O8HjOuw==
X-CSE-MsgGUID: EJj4EOcmSMmtVOaB+gOOjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83724208"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="83724208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:02:04 -0800
X-CSE-ConnectionGUID: V+73n8r9Rpis4gGnDJaUUQ==
X-CSE-MsgGUID: F1QWRbsnSzugm1YwtgQdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="216085101"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [192.168.1.200]) ([10.124.222.216])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:02:03 -0800
From: Vishal Verma <vishal.l.verma@intel.com>
Date: Tue, 24 Feb 2026 18:01:49 -0700
Subject: [PATCH b4] b4: Add option to b4-send to include git-notes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-add-git-notes-v1-1-9b7d3ab24b61@intel.com>
X-B4-Tracking: v=1; b=H4sIAP1JnmkC/yWMzQqDMBAGX0W+cxdMtD30VcRDfla7PcSSTUUQ3
 93YHmdgZodyFlY8mx2ZV1FZUgVzaxBeLs1MEivDtvbRWtuTi5FmKZSWwkrGm9CFu4/OTKjNJ/M
 k2+83wPcY/06//s2hXCMcxwnf/hubdQAAAA==
X-Change-ID: 20260224-add-git-notes-1b1c3c5bda1f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Vishal Verma <vishal.l.verma@intel.com>
X-Mailer: b4 0.15-dev-e2d6e
X-Developer-Signature: v=1; a=openpgp-sha256; l=10530;
 i=vishal.l.verma@intel.com; h=from:subject:message-id;
 bh=RftIX+0Fr8JoM3xgNPdsysCg+D8aP6ni1cAd6U4YIKs=;
 b=owGbwMvMwCXGf25diOft7jLG02pJDJnzvLjvh75+yy+trTGv+F/end7/PW/3W/37cbHjwN8NP
 ZMuCBzd2FHKwiDGxSArpsjyd89HxmNy2/N5AhMcYeawMoEMYeDiFICJrNjEyPB7JhujNP/5nfld
 E7+ueb5n84zyBxNfKZ9YqKOxUqdw3+nfDP8ddz/t/KLMo8LymPXAvK2VaVYH/d8EFviXz9mguui
 WlSsPAA==
X-Developer-Key: i=vishal.l.verma@intel.com; a=openpgp;
 fpr=F8682BE134C67A12332A2ED07AFA61BEA3B84DFF

Add an option (and a config entry) for b4-send to include any git-notes
in the formatted patch after the '---' break.

Note that git-show with the notes option adds notes with a 'Notes:'
prefix, and with an indent. The convention for mailing lists is
typically to just include the notes after the break, without either of
the above. Do some regex munging to remove it.

Assisted by Claude Code.

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
---
I've only tested this using b4 send --dry-run until now. This patch
should be the first time actually sending anything with the
modifications. This paragraph should be coming from git-notes, not from
the b4-prep cover letter as it can for a single patch series - but I've
left the cover letter empty.

 docs/config.rst    | 22 ++++++++++++++++++++++
 src/b4/__init__.py | 13 ++++++++++++-
 src/b4/command.py  |  4 ++++
 src/b4/ez.py       | 29 +++++++++++++++++++++--------
 4 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index a1145af..8c7b3eb 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -437,6 +437,28 @@ Contributor-oriented settings
 
   Default: ``None``
 
+``b4.send-notes``
+  When set, includes git notes in the patches below the ``---`` line. This is
+  useful for adding per-patch changelog entries or other annotations that
+  should not be part of the permanent commit message. Notes are appended by
+  passing ``--notes`` to ``git show`` when generating patches. This can be
+  overridden on the command line with ``--notes`` or ``--no-notes`` flags to
+  ``b4 send``.
+
+  .. note::
+
+     Since git notes are keyed by commit hash, they are normally lost
+     when commits are rebased or amended (e.g. by ``b4 prep --edit-cover``).
+     To make git preserve notes across these operations, set the following
+     in your git configuration::
+
+       [notes]
+         rewriteRef = refs/notes/commits
+         rewrite.rebase = true
+         rewrite.amend = true
+
+  Default: ``no``
+
 ``b4.prep-perpatch-check-cmd`` (v0.14+)
   The command to use when running ``--check``. The command is run once for each
   patch to check. The patch file to check is piped through stdin. If this
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 3d774f7..4309325 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3670,7 +3670,8 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
                          extrahdrs: Optional[List[Tuple[str, str]]] = None,
                          ignore_commits: Optional[Set[str]] = None,
                          limit_committer: Optional[str] = None,
-                         presubject: Optional[str] = None) -> List[Tuple[str, EmailMessage]]:
+                         presubject: Optional[str] = None,
+                         with_notes: bool = False) -> List[Tuple[str, EmailMessage]]:
     gitargs = ['rev-list', '--no-merges', '--reverse']
     if limit_committer:
         gitargs += ['-F', f'--committer={limit_committer}']
@@ -3694,6 +3695,8 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             '--encoding=utf-8',
             '--find-renames',
         ]
+        if with_notes:
+            showargs.append('--notes')
 
         if git_check_minimal_version("2.40"):
             showargs.append("--default-prefix")
@@ -3758,6 +3761,14 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
         payload = msg.get_payload(decode=True)
         if isinstance(payload, bytes):
             payload = payload.decode()
+            if with_notes:
+                # git show --notes adds notes with a "Notes:" header and
+                # indentation. Strip that to match the mailing list
+                # convention of plain text after the "---" line.
+                payload = re.sub(
+                    r'\nNotes:\n((?:[ \t]+.+\n)+)',
+                    lambda m: '\n' + re.sub(r'^[ \t]+', '', m.group(1), flags=re.MULTILINE),
+                    payload)
             if inbodyhdrs:
                 payload = '\n'.join(inbodyhdrs) + '\n\n' + payload
             if gitver and not payload.find('\n-- \n') > 0:
diff --git a/src/b4/command.py b/src/b4/command.py
index 1f8b8f1..37873c9 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -397,6 +397,10 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Resend a previously sent version of the series')
     sp_send.add_argument('--no-sign', action='store_true', default=False,
                          help='Do not add the cryptographic attestation signature header')
+    sp_send.add_argument('--notes', dest='send_notes', action='store_true', default=None,
+                         help='Include git notes in the patches below the --- line')
+    sp_send.add_argument('--no-notes', dest='send_notes', action='store_false',
+                         help='Do not include git notes (overrides b4.send-notes config)')
     sp_send.add_argument('--use-web-endpoint', dest='send_web', action='store_true', default=False,
                          help="Force going through the web endpoint")
     ag_sendh = sp_send.add_argument_group('Web submission', 'Authenticate with the web submission endpoint')
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 298e382..7e7bf5a 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1567,7 +1567,7 @@ def rethread(patches: List[Tuple[str, EmailMessage]]) -> None:
 
 def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtracking: bool = True,
                                prefixes: Optional[List[str]] = None, usebranch: Optional[str] = None,
-                               expandprereqs: bool = True,
+                               expandprereqs: bool = True, with_notes: bool = False,
                                ) -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], str, List[Tuple[str, EmailMessage]]]:
     cover, tracking = load_cover(strip_comments=True, usebranch=usebranch)
 
@@ -1604,7 +1604,8 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
                                       seriests=seriests,
                                       mailfrom=mailfrom,
                                       ignore_commits=ignore_commits,
-                                      presubject=presubject)
+                                      presubject=presubject,
+                                      with_notes=with_notes)
 
     base_commit, _, _, _, shortlog, diffstat = get_series_details(start_commit=start_commit,
                                                                   usebranch=usebranch)
@@ -1767,7 +1768,8 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     return alltos, allccs, tag_msg, patches
 
 
-def get_sent_tag_as_patches(tagname: str, revision: int, presubject: str = None) \
+def get_sent_tag_as_patches(tagname: str, revision: int, presubject: str = None,
+                            with_notes: bool = False) \
         -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], List[Tuple[str, EmailMessage]]]:
     cover, base_commit, change_id = get_base_changeid_from_tag(tagname)
 
@@ -1784,7 +1786,8 @@ def get_sent_tag_as_patches(tagname: str, revision: int, presubject: str = None)
                                       msgid_tpt=msgid_tpt,
                                       seriests=seriests,
                                       mailfrom=mailfrom,
-                                      presubject=presubject)
+                                      presubject=presubject,
+                                      with_notes=with_notes)
 
     alltos, allccs, cbody = get_cover_dests(cbody)
     if len(patches) == 1:
@@ -1796,8 +1799,11 @@ def get_sent_tag_as_patches(tagname: str, revision: int, presubject: str = None)
 
 
 def format_patch(output_dir: str) -> None:
+    config = b4.get_main_config()
+    with_notes = config.get('send-notes', '').lower() in {'yes', 'true', 'y'}
     try:
-        _, _, _, patches = get_prep_branch_as_patches(thread=False, movefrom=False, addtracking=False)
+        _, _, _, patches = get_prep_branch_as_patches(thread=False, movefrom=False, addtracking=False,
+                                                      with_notes=with_notes)
     except RuntimeError as ex:
         logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
         sys.exit(1)
@@ -1916,6 +1922,11 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     config = b4.get_main_config()
 
+    if cmdargs.send_notes is not None:
+        with_notes = cmdargs.send_notes
+    else:
+        with_notes = config.get('send-notes', '').lower() in {'yes', 'true', 'y'}
+
     tag_msg = None
     cl_msgid = None
     _, tracking = load_cover(strip_comments=True)
@@ -1942,8 +1953,9 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         presubject = tracking['series'].get('presubject', None)
 
         try:
-            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision, 
-                                                                presubject=presubject)
+            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision,
+                                                                presubject=presubject,
+                                                                with_notes=with_notes)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert tag to patches: %s', ex)
             sys.exit(1)
@@ -1963,7 +1975,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             prefixes = None
 
         try:
-            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(prefixes=prefixes)
+            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(prefixes=prefixes,
+                                                                            with_notes=with_notes)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
             sys.exit(1)

---
base-commit: 477734000555ffc24bf873952e40367deee26f17
change-id: 20260224-add-git-notes-1b1c3c5bda1f

Best regards,
--  
Vishal Verma <vishal.l.verma@intel.com>

