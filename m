Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6422FE570
	for <tools@linux.kernel.org>; Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755021561; cv=none; b=g0u2nYiBNQEYvTx6B3defaIMXoxLLV4kYLl8dLGq+DkKBvfRex5GBCAymnw4xWdM/nWdLYpYy0hPsMKPmOxRndb/X+zKdM4Dn/vTehpe40dMHY8O08aj9tiMctWvku6JuEBE4O4IhFc1nYtJHNviohgrsmeNjs8J5TVrlaWxb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755021561; c=relaxed/simple;
	bh=unt1X+NDeAo/fYUcPd2CNEPtW4ICRqUCQ6GUuhkQIHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWs/pAvHcWTfLeYL6xScx1TF3fwXWqmdjZSrJSWHJDwxMEnnYmh0KlCMqEEF2Q+qtv/eb8UhjBjbGSCDJBhN8TERn884/DVGn33xyQpLeh88W2RKqya8hUgNM1qrP53kSBDoCn+OIasuUh+05a5wL8TUA5X4pv8K+rD5f5QdDzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSg3CPQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSg3CPQL"
Received: by smtp.kernel.org (Postfix)
	id 47DB0C4CEFC; Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F9F1C4CEF0;
	Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755021561;
	bh=unt1X+NDeAo/fYUcPd2CNEPtW4ICRqUCQ6GUuhkQIHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TSg3CPQLZNZ5vJezNkzhIhbU0q0za2N3m/zx4zI37+qeTZoowlwFF3kqYSmHlfumo
	 +sEqotlYsAj1LLRLxYf6w78EIomKYoP4WWeHN1BUT+8g3q17qepv5maXBinkxxWdZq
	 FNBNOGJW3kXaKB/pRhq2DBSO/3yhfQB+idORe2tjYHYDm8ptUIFiZto+XgTlWGUBnC
	 cIBZcfqubWKBuOTx4A6M+uUmkcM6bOaYkT8QLBUkDmwcHbGx4WZRjzgdlk4nNahcue
	 eVAMgm9I5cu/mhLMKZjqvItYXuNRS+4HZLDzee5wzd9CA3P6w+iY2cZCsfDnWAtGKD
	 NK20/sNqJQhEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C42CA0EDF;
	Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 12 Aug 2025 19:59:14 +0200
Subject: [PATCH b4 v2 1/2] git_range_to_patches: add git options to better
 represent renames and copies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-format-harder-v2-1-53f74982079a@oldschoolsolutions.biz>
References: <20250812-format-harder-v2-0-53f74982079a@oldschoolsolutions.biz>
In-Reply-To: <20250812-format-harder-v2-0-53f74982079a@oldschoolsolutions.biz>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755021559; l=1009;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=bSyncenwTXyl6hnBeb7URh7Kurn8icGV3x9qoXbSXIo=;
 b=MXevnUyDFOBcVOHS7voxgn+6bl714QOjt0LMfmmXiLxuwwWFZYnsGIYWOBBAJPoAROyjRdvzb
 Jqz6VLXzWeKDIF0L6lO6q8ASYK6UMb9gSpYbqa5WQe/fv+W2AEPx+52
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

As remarked in [1] and [2], add the necessary options to get better and more
terse output.

[1]: https://lore.kernel.org/all/7tejkof2kec7ugpz6xugkjrcpzab27lsjpnkphj3vd3xoc4ly7@x3otjziiehju/
[2]: https://lore.kernel.org/all/369fc807-f05e-4837-b623-b718e47fd840@kernel.org/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 src/b4/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ff6075e3a95e0df5f8ba3f717b12ae2bbce03432..93cf016bd705584ace4d61c4968be365a25f2502 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3594,6 +3594,10 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             '--encoding=utf-8',
             '--default-prefix',
             '--find-renames',
+			'-M',
+			'-B',
+			'-C',
+			'--find-copies-harder',
         ]
         smcfg = get_sendemail_config()
         if not get_git_bool(str(smcfg.get('mailmap', 'false'))):

-- 
2.48.1


