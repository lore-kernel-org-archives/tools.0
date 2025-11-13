Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30602586C8
	for <tools@linux.kernel.org>; Thu, 13 Nov 2025 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045179; cv=none; b=EmTE3g5Iqd/yf8yehWRdD7KzNmCL1MDY1R4wxXQkRRh7CRov1vMBA02NVDqCC9njeWNkELxEeeZHPOvIJ9XDgwIaBYt+1WY9lEaYHHbu+2038Cz66FtVjfpSblvn31WJ9amAVXSamyRMCMyRf1iZlomWykFShpo9edZZuqaeZSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045179; c=relaxed/simple;
	bh=jGqCt8dKKnj64w8PDOKsSID6wACElSGtrQuf6/YKRqc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ClBc1IU0S7RQtfc4bXEu622ehPXgyYiLY+YQlJ4gA+04jdYznVHp7mGwVJepucKYTDkeqEWWb5xqVdAaQOWBXl3azKsI5lzKcr5R+/S1VuvRVi/2zRGsY8z8F0s+o4YNPjdUOTewiue6MBDfFFauvxeGiiggYRXPN8w63Bv2L18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFumpJMl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFumpJMl"
Received: by smtp.kernel.org (Postfix)
	id 85C89C2BC87; Thu, 13 Nov 2025 14:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51FC4C116D0;
	Thu, 13 Nov 2025 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763045179;
	bh=jGqCt8dKKnj64w8PDOKsSID6wACElSGtrQuf6/YKRqc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cFumpJMlqD/5kLDdIx/skwkUJ4pHeV61P2TK9fzVnhLQwzGl9mc5Mxb00wq3ZcZpN
	 9nVrASdXoNVm1JTt2w+h7v8pDsZupR8ydV/hTC2q3yrf+MXSyr9BRHl24Cj+42ndCV
	 SV35PzECYPXucOj5/5nuwhMT4Ro3bSXkfj93gcv4yACr4vU65MmnfvQ6UyhXdG6Dax
	 YGmGK3i8g6Un64hrDRB0Mgvy2UACkfhiFsowkrNIdfWcGEE1O5zpHC4gEEzAwWcnpd
	 MSyaUHnGFSeKbTvJoKPyRbCRbbPZvSVZ1WN3jEMa0h6N6R+OYZ0bzaSEyVCqJsOQ8z
	 Ca1FrHntx7aJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A946CCFA13;
	Thu, 13 Nov 2025 14:46:19 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Subject: [PATCH b4 0/2] Add support for presubject
Date: Thu, 13 Nov 2025 15:46:12 +0100
Message-Id: <20251113-sub-v1-0-921bef0da4d2@non.se.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTvFWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Nj3eLSJF1jQ0OLFDODJAMDszQloMqCotS0zAqwKdFKSSZKsbW1ABf
 FcupZAAAA
X-Change-ID: 20251113-sub-3118d60b006f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com, 
 antonin.godard@bootlin.com
X-Mailer: b4 0.15-dev-0f001
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763045178; l=834;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=jGqCt8dKKnj64w8PDOKsSID6wACElSGtrQuf6/YKRqc=;
 b=7lIlvlZMoBedSni2GPwd9jLauK4Sa5w4EOVzRuoCfeU5O24k4QB2PqSQYsTDoNUbsV2Q7rYzx
 Z31Dc6a69ztAguztLFIHg6u2Heu0YiiN9dxCRQl0g9ImN/avx5cBu0Z
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com

This takes the unmerged work from Antonin Godard <antonin.godard@bootlin.com> and adds
the send-receive patch to accept presubjects.

Link: https://lore.kernel.org/tools/20250627-send-presubject-v1-1-f8e11fda1543@bootlin.com/

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
Antonin Godard (1):
      Add support for setting a presubject

Louis Rannou (1):
      send-receive: support for presubjects

 misc/send-receive.py |  4 ++--
 src/b4/__init__.py   | 27 +++++++++++++++------
 src/b4/command.py    |  2 ++
 src/b4/ez.py         | 68 ++++++++++++++++++++++++++++++++++++++++++++--------
 4 files changed, 82 insertions(+), 19 deletions(-)
---
base-commit: a6db3f06ce9836a7fc8921f588452804fc62bed1
change-id: 20251113-sub-3118d60b006f

Best regards,
--  
Louis Rannou <louis.rannou@non.se.com>


