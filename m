Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300513D29F
	for <tools@linux.kernel.org>; Tue, 21 May 2024 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716302518; cv=none; b=RJiH+AOsofBrqYAtsTW9K4BxsDKoIDfqqiGlKUm9+ORc9e6Tooy7mIZPCUreq0UEzZ3PvbUYxKjn+ikzb4ZF3ArRbkd49mpBEnSgos4sXS07psuNPF+S9nLjLXYvbFEIgShUoNQsqcLXS/qU/S63OelKWDV+VT3vpdWr6zL28Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716302518; c=relaxed/simple;
	bh=lfthrnbyIw7JKLeF+EDc5zc4v+/W3gwrgAxx7c7c02c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZK3cUKwcUlD8dRLSDdf1eJhsaUVa9a7KGJtH8M7K855izM2YmTEGn2Mc/gmBrWdigB3In+Uw9iPPib+hQ2fiu3AB5gvOg/eackSVQtqTKba3xTdhtvt+MVnVxZX7DAsCxcDNCK3w5YHehRdUuOEKXwophXdieUxbzlS2j2zuSiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HwMCndxe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HwMCndxe"
Received: by smtp.kernel.org (Postfix)
	id C635DC32786; Tue, 21 May 2024 14:41:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 749A1C4AF08
	for <tools@kernel.org>; Tue, 21 May 2024 14:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 749A1C4AF08
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC8261C000D;
	Tue, 21 May 2024 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716302513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+gwLf5MUNEs7zqdDSVT2Baa1TZzXMcFg7oGGXlnwSY=;
	b=HwMCndxeFanxZ9MOnTi9tzzj91CP+5wPgjtQpgC/ky9PqxXqcyYWeciyCt6DCZ1fbR6/aK
	9jbMJB2JpV5CvfXeyawnb3phtpQwQ7x2zWmRnOA2qkuUChtFwKVsz5Fgk2UtUyplsy7Z1b
	aWAmeHhRDwgHuvFWHiM72bc87jtBOjzi945mg1WS33ADKa1skaHrAKj/SU7JKubdhqY+HU
	a1GpxtQQpa9Hee8qWxvo1lgNq5WPuI1lGy86megmrnY/Vx9Yi1jSRWKWy0fjEetzmGCiRB
	MxOPKc7qttJA56/+6Xp7SDoninLUiLspEtcyve7U9pCoQvOdbXen1v0r4wTjtw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 May 2024 16:41:38 +0200
Subject: [PATCH b4 2/2] ez: Fix check-deps when strategy is commit
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-fix-check-deps-v1-2-d149bf40e7ee@bootlin.com>
References: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
In-Reply-To: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lfthrnbyIw7JKLeF+EDc5zc4v+/W3gwrgAxx7c7c02c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmTLKwZ4lZuF/GAgzsSUzzQFMESu8pCeVCbsJnE
 sMTDV8WDsaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkyysAAKCRAgrS7GWxAs
 4hh7EACSN3Q4WB5NmWIzId4qdSX6H1/p01F5kJEl5DuWcYUgEwhWUf3zRmwUOytMDCEnC/4r6EF
 bHu0XKc2yJ4lygiDe9EU6ogel3IzjWwGdHT0KV7cC72BR0xhIZi2xghTeTWdfzNfndrtDbrsJVE
 qE52t7vMoUbCFecAzT3/Tv7HynrvJ4sdd8fXjQlgSRjMDepIQp5kl5SwN5M/MUpIAWnEejhlOQV
 fyE59sgtU+Gd7joRWJLX56clIvmCD4n+r0oggHlyhnuizVBswydsE2r1ed8wn0uqsN2pp0Z8F6W
 fnsYf6E/dr8aHAE7ZMG32y6mJfsQ7k/qKIBWij9P6RTqJSt41XnSPYPH6Xga2WiO7Yv+4APTz6R
 P5f9ZFsA9R/V+e5Ua0EHqZJmS7A3SuWjjJ8Sszdq+XYKxg8NHCi+Bynk1zqQfzbx+mjFH5jYDE2
 k49gC9yvHbOQHzXnkTm96gqVDAlILrCf8CFPDFdWMCQ2lX1vg6HmbcLl4vjBV00VWx1lZqvn0KY
 LVj5E1SFbhapb3TqB+ZcIU5pfI/HMXdta/4Czbe9PsmL2viM1O4HRVQWT85e+YCg8WP3uSA0MEN
 waSUe0aAV26jmtAJOn984WYWw008hYbzk456n0gEJWVe1n3pCmvXt9nHfjhTBonB2BWcZUQaSwx
 sQUd5g7VXKhf4mw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

When using the commit strategy for the cover letter, the first commit is
empty. This commit can't be applied properly with git am, so just skip it.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

---

I tested to use --empty=drop/keep, but the error was the same, maybe
because there are many patches to apply at the same time?
---
 src/b4/ez.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 76121ab02d03..5e6ed7f90900 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -919,7 +919,11 @@ def check_deps(cmdargs: argparse.Namespace) -> None:
     elif allgood:
         logger.info('Testing if all patches can be applied to %s', base_commit)
         tos, ccs, tstr, mypatches = get_prep_branch_as_patches(thread=False, movefrom=False, addtracking=False)
-        prereq_patches += [x[1] for x in mypatches]
+        if get_cover_strategy() == "commit":
+            # If the cover letter is stored as a commit, skip it to avoid empty patches
+            prereq_patches += [x[1] for x in mypatches[1:]]
+        else:
+            prereq_patches += [x[1] for x in mypatches]
         gitdir = os.getcwd()
         topdir = b4.git_get_toplevel(gitdir)
         if b4.git_commit_exists(topdir, base_commit):
@@ -2451,7 +2455,9 @@ def get_info(usebranch: str) -> Dict[str, str]:
     info['preflight-checks-failing'] = bool(info['needs-editing'] or info['needs-auto-to-cc'] or
                                             info['needs-checking'] or info['needs-checking-deps'])
 
-    # Add commits information
+    # Add informations about the commits in this series
+    #   `commit-<hash>`: stores the subject of each commit
+    #   `series-<rev>`: stores the commit range for a particular revision
     for line in oneline:
         short, subject = line.split(maxsplit=1)
         info[f'commit-{short}'] = subject

-- 
2.43.2

