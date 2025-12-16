Received: from mail.tilde.green (mail.tilde.green [162.19.47.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD62C32C943
	for <tools@linux.kernel.org>; Tue, 16 Dec 2025 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.19.47.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765905355; cv=none; b=YQYyzEaOGDtSorgG7AKqYohX+9D3WihHLrwK1+LWqqcZ5TJMWt7GQ5Vm+gFioUufODfgFsHdyFFOGBEj9/EYvTyrSZ6aCl5nSAcSiOTjbELpFfvp2HqRMGH6y24ktQiS6wP3vHrr7a9YQN/n5SfrUW8zP4d4vWEdhCAv7gFQLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765905355; c=relaxed/simple;
	bh=amw54YMFGJ5NGg22TiE9NwiSGYvVt5VmTY4bpHL+vrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJcxCQV5NXEJcCXfchWVLOl2AtDW9GYaSnwwz0HQOgRnq+nbSd/XTPouCziP1irBRhZPSCtRzTLl2uNlAhm5TqVbrUb7SoUDihjKM8ndsJ0GLjvw5QpuyxZ5xWW+621O1E01HugtD5WTAAq7vG0/8DCVjeV/1iBaTug0cGkWg1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iwnp.org; spf=pass smtp.mailfrom=iwnp.org; dkim=pass (2048-bit key) header.d=iwnp.org header.i=@iwnp.org header.b=V/VFkMN2; arc=none smtp.client-ip=162.19.47.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iwnp.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwnp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iwnp.org header.i=@iwnp.org header.b="V/VFkMN2"
Received: from localhost (177.red-81-35-81.dynamicip.rima-tde.net [81.35.81.177])
	by mail.tilde.green (Postfix) with ESMTPSA id 35FB3B40537;
	Tue, 16 Dec 2025 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iwnp.org; s=2024081101;
	t=1765904768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FzIk/xVtvuUqoNTXfwGpq0LGTupwxhcQ0lNqFN4JoS8=;
	b=V/VFkMN2wYrEmYkQ4w9M5XplfeNPYg66d5fZNdGln2z1slezZnXGQZxnwpDgf93qoTSi8y
	Nz4gtA9mn8tF8FDZyWkhtqZVyRdhua3oSeKui5WaO4wLO5EyXzxmZM6R5qtr7/6b6qbhOY
	hhoFhKETo5CtLpGcQLOLZ9LIshjgZZXZN8z+WDKv8dFOzFbXtKGFzQ1AZeJ00TSUUhi+mH
	ce4E580GDHhnwf6iaJdP445CEjOB0zXXamdyD8Jx+ku3ynVYUWlnzJVUGDveaBolAPvBB5
	7WHUhAXm3pxpJ14YWyl/g0IYVFfTNFhdTGta4kgu9iYJ6bilU+yYhw6KfgijAQ==
From: klea <klea@iwnp.org>
To: tools@linux.kernel.org
Cc: klea <klea@iwnp.org>
Subject: [PATCH] software: link rot, fix url
Date: Tue, 16 Dec 2025 17:05:47 +0000
Message-ID: <20251216170553.1629989-1-klea@iwnp.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 software.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/software.rst b/software.rst
index 209ab0e..285311b 100644
--- a/software.rst
+++ b/software.rst
@@ -14,7 +14,7 @@ repository for the reference.
 .. _postfix: https://www.postfix.org/
 .. _mlmmj: https://codeberg.org/mlmmj/mlmmj
 .. _public-inbox: https://public-inbox.org/
-.. _README.postfix: https://codeberg.org/mlmmj/mlmmj/src/branch/master/README.postfix
+.. _README.postfix: https://codeberg.org/mlmmj/mlmmj/src/branch/master/README.postfix.md
 
 
 Configuring public-inbox with mlmmj
-- 
2.51.2

