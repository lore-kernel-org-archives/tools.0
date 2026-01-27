Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FFC3242CA
	for <tools@linux.kernel.org>; Tue, 27 Jan 2026 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518408; cv=none; b=L9tCzOI5hu6STzReGziOTFXhwAZ2pCqtPMzIF+HriXCWAGYTxYIG+Pji3FDycMV75xXVMl9gc3IJaI/RhisucDQRi2en6f2VAKbFDNjxX8ak49+gI6mT8raWb+QV8nSXFWt6MIEZBOZ6hhPJZN96fLMD116Zsy6tC2uIkhZIMc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518408; c=relaxed/simple;
	bh=GyZ11Nauqrx9efrb6+YHqSHUNLLP3nR1jus+wGfV5o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tYnatrwhzd+ilBCKJbKIGY03JQzR1XiBNDxTAKmVoXtQNqmesilKaAkf8TR0F6wKhbU9yQokta7A5gqGiQ6MNMdXnJI1069QKKh5mRP4Jkisz/TrnYk9U57PeAscmivQ198v5Nw4l8U1AsT2xIYtzwM52ZuisvnFC45jxESYJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=BB619Pxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="BB619Pxm"
Received: by smtp.kernel.org (Postfix)
	id 09ECAC116D0; Tue, 27 Jan 2026 12:53:28 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D284AC116C6
	for <tools@kernel.org>; Tue, 27 Jan 2026 12:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D284AC116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=cusVxDW6Q0Ykh7xmNmefvlq0kVzREOCSd3bYUjq9wSs=; b=BB619PxmGK2g1NSMXL41qg6uw3
	FHMJUuqt25FIu7QoO1l/p1P7Nom+HarSSLFxayIjjj1I7DTqfGH7JnEluxlXhKwOB/wElurqceBN0
	wzklrImuQSObcLSEnh6WdEH7x48qX8siyhGMWjMpwhjuYi3BOhAQChZV2CSlN5JLtYxgQCKQUHkl3
	zo9+MHcMTgE5u6fku/aVBC/H+AaVU8GyAP+kSxFFRMtxpcnvNdRZyzYh4eNnmYcp5TM6RMreqG4A2
	v3muP9EMFzYsxk9bawJnhd9YBVXobcKO73I5l3DPRdgeUwF/FCHRkSHdB21MSwSGxJUWZ5BEpqVkG
	5D3WmrqQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vkiZN-00GzzM-D3; Tue, 27 Jan 2026 12:53:21 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 27 Jan 2026 04:53:08 -0800
Subject: [PATCH b4] send: Add --force-cover-letter to send separate cover
 for single patch patch series
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
X-B4-Tracking: v=1; b=H4sIADS1eGkC/yXMQQrCMBAF0KsMf91AE4qVXEVcmPSnRqSRSSxC6
 d1Fu32Lt6FSMyu8bFCuueaywIvtBPF+W2aaPMELXO9OvXWjSUUjTSwr1TzZGtXQjlOKDO7MAZ3
 gpUz5808vCAOuh9V3eDC234Z9/wKbMaZXegAAAA==
X-Change-ID: 20260127-force-cover-letter-e17dfceb28e4
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-933c2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5313; i=leitao@debian.org;
 h=from:subject:message-id; bh=GyZ11Nauqrx9efrb6+YHqSHUNLLP3nR1jus+wGfV5o0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpeLU+ufdmATmRYKVDrHqn4o16hstmRZnCw71dt
 5N3izHuBXGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaXi1PgAKCRA1o5Of/Hh3
 bR4tEACkBR6G8J5PW7Ppthn46Xlls88Zy2TD8lqkI6+yyEqL//7nCR41cFI2PVpfuU5IJ1gqd6X
 uNKCsGB5bcV/1h25VjffYABOcTfcEVVHf387Q3/i92cJKe5OUt73laIVyay2BvFbb1MBtvKvzUc
 5mulQCwgo1KfUMTkpU8zwtU4OCP8CuD0XxWtUn7NCM6PEIbW+Ie0KR6QeMlBukSGEXamuBuBgfT
 njeScZUhz750y4wBXgC1R7Wm/lgXeueSXKIepfXl+204RDkCkbjFAZHgsfddPI1NsRLdkIcKVD0
 l7CxPuVLgOpWLeuSGVx/5r2Z7tY2vDjBMYrl8nbYQgWzP6W38C+PZXLcyWpllsHD0WzCzWqHOBV
 EdEArx0DBpnYeGc/EaCToaNM+cL/C87wG0ZSgTgimKEjixkXUEoP0gRDX6SV1lONdnfM2a8sm64
 lnKXIu42HgLJUxzy9HXahMDU1fwk6vva0dfJTu5QW+YZEYJ8bIL7T2g1rJk9J6UREp6aH5cxpHf
 k/hSo8oo6RKmKZMW3atLvo8182kBHe+JFxuPOEOXW+0mfnMfQkjhXmxzDYWjwaEB3t6elt6AN1z
 1BLWlRFFsv9IFysxDRlUOuRPQaQffBEXOR0S/AuC7x7rGOps3WQSP91z19aQfpcagCs8UIreHxv
 B3BmRQKlYf/olVg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

By default, b4 mixes the cover letter content into the patch body
(under the --- cut line) when sending a single-patch series. Add
--force-cover-letter option to allow sending a separate cover letter
message (as 0/1) even for single-patch series.

This is useful when developers want to send a long cover letter with
extra information about an issue, and a commit. Having the cover-letter
"mixed-in" makes it hard to follow.

Example:
 * https://lore.kernel.org/all/20260127-ipmi-v1-0-ba5cc90f516f@debian.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 src/b4/command.py |  2 ++
 src/b4/ez.py      | 16 +++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index 1f8b8f1..0e685cd 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -397,6 +397,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Resend a previously sent version of the series')
     sp_send.add_argument('--no-sign', action='store_true', default=False,
                          help='Do not add the cryptographic attestation signature header')
+    sp_send.add_argument('--force-cover-letter', action='store_true', default=False,
+                         help='Send a cover letter even for single-patch series')
     sp_send.add_argument('--use-web-endpoint', dest='send_web', action='store_true', default=False,
                          help="Force going through the web endpoint")
     ag_sendh = sp_send.add_argument_group('Web submission', 'Authenticate with the web submission endpoint')
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 298e382..42379a7 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1567,7 +1567,7 @@ def rethread(patches: List[Tuple[str, EmailMessage]]) -> None:
 
 def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtracking: bool = True,
                                prefixes: Optional[List[str]] = None, usebranch: Optional[str] = None,
-                               expandprereqs: bool = True,
+                               expandprereqs: bool = True, force_cover: bool = False,
                                ) -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], str, List[Tuple[str, EmailMessage]]]:
     cover, tracking = load_cover(strip_comments=True, usebranch=usebranch)
 
@@ -1735,7 +1735,7 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     thdata = ''.join(wrapped).replace('X-B4-Tracking: ', '')
 
     alltos, allccs, cbody = get_cover_dests(cover_letter)
-    if len(patches) == 1:
+    if len(patches) == 1 and not force_cover:
         mixin_cover(cbody, patches)
     else:
         add_cover(csubject, msgid_tpt, patches, cbody, seriests, thread=thread, presubject=presubject)
@@ -1767,7 +1767,7 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     return alltos, allccs, tag_msg, patches
 
 
-def get_sent_tag_as_patches(tagname: str, revision: int, presubject: str = None) \
+def get_sent_tag_as_patches(tagname: str, revision: int, presubject: str = None, force_cover: bool = False) \
         -> Tuple[List[Tuple[str, str]], List[Tuple[str, str]], List[Tuple[str, EmailMessage]]]:
     cover, base_commit, change_id = get_base_changeid_from_tag(tagname)
 
@@ -1787,7 +1787,7 @@ def get_sent_tag_as_patches(tagname: str, revision: int, presubject: str = None)
                                       presubject=presubject)
 
     alltos, allccs, cbody = get_cover_dests(cbody)
-    if len(patches) == 1:
+    if len(patches) == 1 and not force_cover:
         mixin_cover(cbody, patches)
     else:
         add_cover(csubject, msgid_tpt, patches, cbody, seriests)
@@ -1942,8 +1942,9 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         presubject = tracking['series'].get('presubject', None)
 
         try:
-            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision, 
-                                                                presubject=presubject)
+            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision,
+                                                                presubject=presubject,
+                                                                force_cover=cmdargs.force_cover_letter)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert tag to patches: %s', ex)
             sys.exit(1)
@@ -1963,7 +1964,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             prefixes = None
 
         try:
-            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(prefixes=prefixes)
+            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(prefixes=prefixes,
+                                                                            force_cover=cmdargs.force_cover_letter)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
             sys.exit(1)

---
base-commit: 477734000555ffc24bf873952e40367deee26f17
change-id: 20260127-force-cover-letter-e17dfceb28e4

Best regards,
--  
Breno Leitao <leitao@debian.org>

