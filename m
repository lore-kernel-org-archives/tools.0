Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC621ABD7
	for <tools@linux.kernel.org>; Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752674651; cv=none; b=XQ225AZXJuBHcPmwdw2d0J11HfeZ0faqzLqru3H4Kh6oPELnWG15meRZn58Abt18igZZtXAwU8cvRKkrr7SGD6m6OaORBtQ4xSWqZL+jRsbGsQqfOFu9EGn1pKpHA3HolydLE2SEh9B1WGwYXRk/zyH4WOvoHV9LTmUmwDj5LWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752674651; c=relaxed/simple;
	bh=mNtmASfQn5Qd6LgUzKEINiHI9wiuD+PQyjhk3fbOy/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4yD2W4LmXgjMjZ3wOlNnoHZvul6nBu9Bva7HdwN1HZkgOyHWpcM2VTiv/A0iv3MTVevHVt1ROqpqWyU5hiPGGsLTbgmcZt7TTgot2Q2hs5bodl5vGJcQOzpU/IocLId9iHAdhDYkZFhj4OY3aL5mnbQju2SgTfhupOVBy07dJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/yJvEja; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/yJvEja"
Received: by smtp.kernel.org (Postfix)
	id 589DAC4AF09; Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4278BC4CEF0;
	Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752674651;
	bh=mNtmASfQn5Qd6LgUzKEINiHI9wiuD+PQyjhk3fbOy/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b/yJvEjaIje6vpUIJQOus94ePHvmRIsAYhwNEM/8izs5NJlXpKywy4VqDDg9BAWWv
	 1w6/6xp4iJGhrDRxzvPRdGhrK77UNmDUzSIvH3ChrK1q90+poLLLAJHTmiQv8OZxRp
	 d2aKwjJjeN+L9I3yLzYFtsFsmvg58JQn52VZirN4NqW/9ZDYw8IJYddZezoJCOh9N+
	 l668We3V50gOyZQLm9cVRMtCGXiKpUppTk3cPehEBBTz0OWdwEb23m97U53xSqpBFv
	 AQ9HznM2R9rixcIoqA6LnXsfKBHqgbfm2AclUFuDWYyhzHsLCcUdZVyMM+NkzE198T
	 heBPvVbwPzBvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DC4C83F22;
	Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Wed, 16 Jul 2025 16:04:09 +0200
Subject: [PATCH RFC 1/2] Fix usage of PATCH in prefixes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-prefixes-v1-1-b8652d4de0a6@non.se.com>
References: <20250716-prefixes-v1-0-b8652d4de0a6@non.se.com>
In-Reply-To: <20250716-prefixes-v1-0-b8652d4de0a6@non.se.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752674650; l=1639;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=CfLpz8qB6gnvrEky8wC9S3UK+CoOrRvn6rKhhoHGcko=;
 b=osH708Kjx5Egvr2aVJDIYzv3YTPn1h1t8UnONo2/zrvqrU6yXeHNPMEMyXAjqeyK7OXK9aA6a
 D4zs41SAqD0A5IgySjUtf/4/co6ZQJcXXFa0lvHa+MZio7qvQjS90cI
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com

From: Louis Rannou <louis.rannou@non.se.com>

Several projects have a '[prefix]' before '[PATCH]'. While git-send-email
supports having prefixes before 'PATCH' using a 'prefix][PATCH' syntax, b4 still
prepends prefixes with '[PATCH '.

Including 'PATCH' in prefixes is not sufficient as it will keep an extra space
before the 'PATCH' keyword.

Before:
b4 prep --set-prefix 'prefix][PATCH' gave [PATCH prefix][PATCH]
b4 prep --set-prefixes prefix PATCH  gave [prefix][ PATCH]

After:
b4 prep --set-prefix 'prefix][PATCH' gives [prefix][PATCH]

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 src/b4/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ff6075e..72ef79b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2568,14 +2568,16 @@ class LoreSubject:
 
     def get_rebuilt_subject(self, eprefixes: Optional[List[str]] = None) -> str:
         exclude = None
-        if eprefixes and 'PATCH' in eprefixes:
+        rpatch = re.compile(r'.*\[PATCH', re.IGNORECASE)
+
+        if eprefixes and list(filter(rpatch.match, eprefixes)):
             exclude = ['patch']
         _pfx = self.get_extra_prefixes(exclude=exclude)
         if eprefixes:
             for _epfx in eprefixes:
                 if _epfx.lower() not in [x.lower() for x in _pfx]:
                     _pfx.append(_epfx)
-        if 'patch' not in [x.lower() for x in _pfx]:
+        if not list(filter(rpatch.match, [x for x in _pfx])):
             _pfx.insert(0, 'PATCH')
         if self.revision > 1:
             _pfx.append(f'v{self.revision}')

-- 
2.43.0


