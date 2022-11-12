Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CCCA4A
	for <tools@linux.kernel.org>; Sat, 12 Nov 2022 13:16:59 +0000 (UTC)
Received: from localhost.localdomain (dynamic-077-004-019-021.77.4.pool.telefonica.de [77.4.19.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by proxmox1.postmarketos.org (Postfix) with ESMTPSA id C454D1402F3;
	Sat, 12 Nov 2022 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=donut; t=1668258704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yl18bpGwyVGtbGmlH4BbY3LEPFwgbf1ZPxb4SGIWFZQ=;
	b=gH8YB6JtqUy3NI05yDgkKud9kIxW/dTeJGoJDYYswiksYZ8sVrDXw6uErHu0OW93OQMp/m
	f6OxiSmC+5PEgLMjPT5YRHLycbuiMlz3LrH1IKP/Nf7LA0gPxV5EkbCuKEjpOSp7ohorW3
	qVKNUOdWJuVbtFFqAc7ScJQ+YZir9uA=
From: Oliver Smith <ollieparanoid@postmarketos.org>
To: tools@linux.kernel.org
Cc: Oliver Smith <ollieparanoid@postmarketos.org>
Subject: [PATCH b4 0/1] How about adding SourceHut lists as 2nd backend?
Date: Sat, 12 Nov 2022 14:11:13 +0100
Message-Id: <20221112131114.2370-1-ollieparanoid@postmarketos.org>
X-Mailer: git-send-email 2.34.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I found that with relatively few changes it's possible to add SourceHut
as alternative backend to b4. Is this desirable to have in b4?

Best,
Oliver

Oliver Smith (1):
  RFC: Support SourceHut as additional backend

 b4/__init__.py | 79 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 4 deletions(-)

-- 
2.34.3

