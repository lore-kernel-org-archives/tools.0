Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4B1482EC
	for <tools@linux.kernel.org>; Wed,  3 Apr 2024 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150974; cv=none; b=qIqQLTEw+foL/qSqemIAqGFmgT5PEpXpkpCr6FLUO/fB9Pzhf4WTYIavfogotXvSnjiXhvlwRCt6exRkiElhAb7MQb0SD8icQXs2aY58gl4adE5i0vu3etnDWx4bAJXECkl28MjgT9KMno93OXhsSLaxHX5CGqyvl8AKef/lHxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150974; c=relaxed/simple;
	bh=OCz0tQYN21Tn9+TUIRNd/GORWoNiacXfdkM7XCF9Cgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q6iiSogZtY3T1WNowXUxRV4cC4mk0bCu1RFc05rEArXwVtGFm+1lg1W5rncBzG+O98tGvL0rTz9Kl0jAdrUdtxAcuKSj6psp9ZqZLxo3F2DQqPYIWe92X4Y6qmr+nfujNYKU11ERhIUqOCN0sjaOWlEVcql91vfHoKOifsHrW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xmn8Gmwq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xmn8Gmwq"
Received: by smtp.kernel.org (Postfix)
	id 6572FC433F1; Wed,  3 Apr 2024 13:29:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58213C433C7
	for <tools@kernel.org>; Wed,  3 Apr 2024 13:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58213C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 324F8FF809;
	Wed,  3 Apr 2024 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712150964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u+Nv5ETl6+Bt2lvewNph8RujXx2MLgpMOgE6e0WZlX0=;
	b=Xmn8Gmwq9Nlb1cve5lZiZRHwJDL0WpqPmylKP8qT/BW45ZNnq83dEc0EbK3cpmza70XyPz
	KXkhFGZuWhNCUne7aOmOGqw0iuChvjzCCvw5KP6LkwZ8MDMpmvNzQifNOfw2ZriurLA7e6
	IIDAheQBYFUwE/q5A/zByOzBR9ri1FI9CSC87UxU36NAj0BKF3x30i6F0KQB7ToJ3HO1mp
	3lMcTJEXwlpbRVwBAS0pAvfAz2K0wt6+sWWYAKNg2MDjKYrznb3Fxi8e8zO/k6IGwtSx1I
	mqdmCWzgRbIQ7Ugqwt3WV3RWUwrYHUj94iCnDwmqWdsiuJlyF92lbfyVGXV6VA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 03 Apr 2024 15:29:17 +0200
Subject: [PATCH b4 v2] ez: Prevent overwriting an unrelated cover letter
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-avoid-overwritting-cover-letter-v2-1-cb43a8df8ce2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKxZDWYC/42NwQ6CMBBEf4Xs2Rpowagn/8NwoO0Km2CXtE3VE
 P7dlS8we5i8mc3MCgkjYYJrtULEQok4COhDBW4awoiKvDDoWre10Wc1FCavuGB8RcqZwqjcj9S
 MOYt0XWud1xcr/yAtS8QHvfeFO9gWevEmSpnjZx8tzZ783V8aJXdqvKkRO2PczTLnmcLR8RP6b
 du+bLhpNdQAAAA=
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3057;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=OCz0tQYN21Tn9+TUIRNd/GORWoNiacXfdkM7XCF9Cgg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmDVmz5Ai/d9KuvGMhVhFtrHSm3Ei40dlkt4ize
 Q8hhb2EUw6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZg1ZswAKCRAgrS7GWxAs
 4qLOD/4h/RgGCKo0hzLLfr7mURD+abe5yx4/tt/KxhAr5c8vmLpY7CXTK8wldYBJVmQyGa/LmWc
 SlZH49PGfgggwgiDqcwKX/iGO+NR03bB8J8zSBgFQGsnKoC07G6/J1Jv6aNPc1DKsbgMj9dkets
 Tx+ksR7nqFN5MAp9LHuxoT7dg9VqBt0wJW38QZuqEug/Mq/U3t5gH9jgQV++WhXEeK+Brr8rmxC
 HCeSU1eAYN9gL/aEGK9dlZUHFVp5h3KIKGjOCuY2JBHUjCKeNlXWlk4y8IMWFz4bKWANffjDH9M
 J1XDcJ4uk0HiY+NucqZDHEDQFifLRNjjt+BV2MyeRY4/S/K8+3bJa/TvrYPc+stHItF34epsrqQ
 vUjzN5lMta9xdFjpipZej+M0T3fOu9LrMGHy6SIRBltLfOLqG1X/jEwJRIKRwiogRPuv7XOAj0k
 ePziqiC7euvbKEwRuqWPeLg8mEEwu6twV1dCF1jNfJJ2aMoe6BqrX5Yb3XBgXcUSULbTycw+6u3
 cuaklOK+BCehUMjuytod/XMKouh77algs+VP4Iai5GFG74eKzfnGmbTuy4rdb81Ae+G8m2Nmqsx
 zTdaGVVsuwK5PJesSj/wc/2HrU4aYmZOW1y2l/lkN3pVdZhRwdyjuMUvFJF31ELMHipNZ5Fg840
 RMZgD3QkBAEFZXA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

When editing a cover-letter, b4 expectedly selects as base the
cover-letter of the currently checked-out Git branch. When
saving/closing the editor, b4 also saves the changes as the
new cover-letter for the currently checked-out Git branch.

While simplistic and apparently totally fine, it does not play well
when working on multiple branches. Said otherwise, the following
sequence of events will write the wrong file, possibly smashing a
valuable cover-letter:

	$ b4 prep --edit-cover
	<make some changes>
	$ git checkout another-branch
	<oh, I forgot to save and close the cover letter editor!>
	*crunch*

As suggested by Konstantin in [1], instead of checking only for the cover
letter, this patch add a check around edit_in_editor. If the branch
changes during the edition, the operation is aborted and a backup of the
new file is saved.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

[1]: https://lore.kernel.org/all/20240328-premium-mouflon-of-tolerance-bdcdb5@lemur/

---
Changes in v2:
- Moved the check to edit_in_editor
- Link to v1: https://msgid.link/20240328-avoid-overwritting-cover-letter-v1-1-161d30ee533c@bootlin.com
---
 src/b4/__init__.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 169b461bca1a..3af032e3ff83 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4157,6 +4157,9 @@ def git_fetch_am_into_repo(gitdir: Optional[str], ambytes: bytes, at_base: str =
 
 
 def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
+    # To avoid losing the cover letter, ensure that we are still on the same branch as when the cover-letter was originally opened.
+    read_branch = git_get_current_branch()
+
     corecfg = get_config_from_git(r'core\..*', {'editor': os.environ.get('EDITOR', 'vi')})
     editor = corecfg.get('editor')
     logger.debug('editor=%s', editor)
@@ -4176,4 +4179,12 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
         with open(temp_fpath, 'rb') as edited_file:
             bdata = edited_file.read()
 
-    return bdata
+    write_branch = git_get_current_branch()
+    if write_branch != read_branch:
+        with tempfile.NamedTemporaryFile(mode="wb", prefix=f"old-{read_branch}".replace("/", "-"), delete=False) as save_file:
+            save_file.write(bdata)
+            logger.critical('The edition started on the branch %s but the current branch is now %s.', read_branch, write_branch)
+            logger.critical('To avoid overwriting an unrelated text, the operation is canceled now and your text is stored at %s', save_file.name)
+        raise RuntimeError(f"Branch changed during file edition, the temporary file was saved at {save_file.name}")
+    else:
+        return bdata

---
base-commit: 23970c613f40356cc88716d07c2d427ca024e489
change-id: 20240328-avoid-overwritting-cover-letter-554bcd29b240

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

