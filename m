Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.11830.1604055119471344407
 for <tools@linux.kernel.org>;
 Fri, 30 Oct 2020 03:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kernel.org header.s=default header.b=vUZlDrV5;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: maz@kernel.org)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8701E20728;
	Fri, 30 Oct 2020 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604055118;
	bh=8Y3zeZl/rnRB/8LTSA0IGeEoiVENzt9soWpS/wvWpvU=;
	h=From:To:Cc:Subject:Date:From;
	b=vUZlDrV54Zcy2lA5LF37PZb7eRVNyOKLOlvY8KquDhYRnBzRY2AYLfJ67R/M09/ph
	 i+DMnK7Ro5RaimHWHr70VCsyDJJjX3+7u/t+g4Uycq9vqG51PIEPYj1a82/Rbn6EoM
	 ir9hG1uYA9LnCuKaA/A3T02+V689eMHZM/PQBdqE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=hot-poop.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <maz@kernel.org>)
	id 1kYS0i-005ihZ-E5; Fri, 30 Oct 2020 10:51:56 +0000
From: "Marc Zyngier" <maz@kernel.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org,
	konstantin@linuxfoundation.org
Subject: [b4][PATCH] Fix handling of series with the [PATCHvX] defect
Date: Fri, 30 Oct 2020 10:51:53 +0000
Message-Id: <20201030105153.3015432-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tools@linux.kernel.org, users@linux.kernel.org, konstantin@linuxfoundation.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Content-Transfer-Encoding: quoted-printable

b4 tries to handle subject lines such as "[PATCHvX]" by replacing
the subject line in situ, but seems to do a rather bad job of it,
resulting in only the first patch of the series being picked up.
Fetching <20201026134931.28246-1-mark.rutland@arm.com> does exhibit
the problem.

Fixing the re.sub() expression allows normal funtionalities to be
restored, and the above series to be fetched.

Fixes: 6bf644f14b3f ("Deal with [PATCHvX] subject")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index a1479aa..c6d43b2 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1389,7 +1389,7 @@ class LoreSubject:
             subject =3D re.sub(r'^\w+:\s*\[', '[', subject)
=20
         # Fix [PATCHv3] to be properly [PATCH v3]
-        subject =3D re.sub(r'^\[\s*(patch)(v\d+).*', '[$1 $2$3', subject=
, flags=3Dre.I)
+        subject =3D re.sub(r'^\[\s*(patch)(v\d+)(.*)', '[\\1 \\2\\3', su=
bject, flags=3Dre.I)
=20
         # Find all [foo] in the title
         while subject.find('[') =3D=3D 0:
--=20
2.28.0

