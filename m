Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C12DF3CC
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763501671; cv=none; b=mVbOdZ9d7jIOu87j9sWu0D+wa+rEX0KukXaSp9em1DsnGu1KFFchd+h/A3IokzhV4y2sSwCYes9mmeBfd9qmO6cj20KBSarR6TnF1SWYLOuFuPQxvsmUAwCLL5wEUo9KBIfjkFnVOhaOLrpG8gbfvAC4BO4lpoTkqDMiYulAK48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763501671; c=relaxed/simple;
	bh=kLNqzseVHn5DIOMflDFKDtB1QOqgiNfcKZ6YBqdyRzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DGWCt03DzniX9x7mL6I1gqxQV110TKQAmPIcZNDgPM17otvTRUrsxEhWQ3DJd+nuCxPref6wqalt7RxN9dgCskcYDz9YDr2QdYCNpaWB2/1fTURhfvHBhcyPFSHMnxp0mXbkeVGI+73X6xBssUt8idiaK9Tt8WijG9bU8z4dRGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJ/1neip; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJ/1neip"
Received: by smtp.kernel.org (Postfix)
	id 5AFD1C4AF0B; Tue, 18 Nov 2025 21:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30B2DC2BCB7;
	Tue, 18 Nov 2025 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763501670;
	bh=kLNqzseVHn5DIOMflDFKDtB1QOqgiNfcKZ6YBqdyRzY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EJ/1neiptKF2V17851p37u54Td+C6Nv3riwoV6ekPDhfmat3ws8ZDuJs8E26CggAm
	 pSwGjj7NJUgolCB22ezv5p3eZCJ3oY+ji2xSdEQTNdlfQ3BrVG06gh4URImfdg7Kk0
	 UolxKhkU8lbSOp5XDmo+vv5Z1wTHDeF75EMyf+KmCJlX9+ZtuZ60+0Cnnp9hjiv8U/
	 l2/FWFo0cy8qlRVKM1kS9qKmPZmqypf5/rbdTpqO+nSUasKvofb/K7ntX3qQVsN6ql
	 QtNyUnDY06OHFBTL4drOF3Uwxa5qiZGy6sMX5xyg/N4ChYBuPTcl7FWz9Ly+j11y7f
	 L0x5eopOmX+DA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1464CEE334;
	Tue, 18 Nov 2025 21:34:29 +0000 (UTC)
From: Dave Marquardt via B4 Relay <devnull+davemarq.linux.ibm.com@kernel.org>
Date: Tue, 18 Nov 2025 15:34:25 -0600
Subject: [PATCH RESEND v2] Make edit_in_editor use temporary file in Git
 repository
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-edit-with-tmp-file-in-repo-v2-1-0b633b471ddb@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAGDmHGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0ML3dSUzBLd8sySDN2S3ALdtMwcoIo83aLUgnzdpGSDFAMTM1MzM8N
 EJaABBUWpaZkVYMOjlYJcg139XJRia2sBrvDwf3QAAAA=
X-Change-ID: 20251118-edit-with-tmp-file-in-repo-bc0d0465661a
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dave Marquardt <davemarq@linux.ibm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763501669; l=1793;
 i=davemarq@linux.ibm.com; s=20250630; h=from:subject:message-id;
 bh=ngJvMGXX1Dy1JqdS+DDokUJ9Gr/lhNU5s71yzHfnFNg=;
 b=IT9xwP2MjpyFEL9n3PUSRlawabt1OX3jrgcCSu0kNIbLSw6Gb2E9B356jHZnkMiQE7moin/9t
 mxkhOQ1wUFFBeSQ7Bz7XkfRKGUsUS627nbd7jVRM04Wu0ahRRBkkzTd
X-Developer-Key: i=davemarq@linux.ibm.com; a=ed25519;
 pk=eCwwhqOykPrqNNTH1uSGAhXUfNQI0Zlz7hb8uGTjPVU=
X-Endpoint-Received: by B4 Relay for davemarq@linux.ibm.com/20250630 with
 auth_id=447
X-Original-From: Dave Marquardt <davemarq@linux.ibm.com>
Reply-To: davemarq@linux.ibm.com

From: Dave Marquardt <davemarq@linux.ibm.com>



---
This is a resend of a patch I sent in June 2025. I noticed on
reinstalling b4 that this hadn't been included in recent releases, and
I couldn't find it in the master branch either.

In edit_with_editor, create temporary directory in toplevel/.git/b4 if
git top level exists. Otherwise let tempfile.TemporaryDirectory use
its default directory. This avoids issues with Emacs and Magit, which
insists COMMIT_EDITMSG must be in the repo's directory tree.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 src/b4/__init__.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 7689550..cc7623a 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4575,8 +4575,16 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
     corecfg = get_config_from_git(r'core\..*', {'editor': os.environ.get('EDITOR', 'vi')})
     editor = corecfg.get('editor')
     logger.debug('editor=%s', editor)
+
+    topdir = git_get_toplevel()
+    if topdir is not None:
+        p = Path(topdir)
+        p = p / '.git' / 'b4'
+        p.mkdir(parents=True, exist_ok=True)
+    else:
+        p = None
     # Use filehint name in hopes that editors autoload necessary highlight rules
-    with tempfile.TemporaryDirectory(prefix='b4-editor') as temp_dir:
+    with tempfile.TemporaryDirectory(prefix='b4-editor', dir=p) as temp_dir:
         temp_fpath = os.path.join(temp_dir, filehint)
         with open(temp_fpath, 'xb') as edit_file:
             edit_file.write(bdata)

---
base-commit: a6db3f06ce9836a7fc8921f588452804fc62bed1
change-id: 20251118-edit-with-tmp-file-in-repo-bc0d0465661a

Best regards,
--  
Dave Marquardt <davemarq@linux.ibm.com>


