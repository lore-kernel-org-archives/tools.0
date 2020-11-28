Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by mx.groups.io with SMTP id smtpd.web12.29761.1606545746983888447
 for <tools@linux.kernel.org>;
 Fri, 27 Nov 2020 22:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kyleam.com header.s=key1 header.b=LXY4Snvc;
 spf=pass (domain: kyleam.com, ip: 91.121.223.63, mailfrom: kyle@kyleam.com)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1606545780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ozhoLfdyBwJ770tpUbc8bvsPfV+xIW/MOefzKCZPs+4=;
	b=LXY4SnvcelHCeKpxm5cb9ErYF8Zu2HKshkPwGdb5vRYcyIlaMpOon8r2LVIpEiPRM/wmwB
	XSFgW+PfgadG+1bmj2/syx/O9iHMiuHr/mBDQWuEBOMDI+lBuIqx2sKfUOkC976/umFkVa
	6LltdCAw61GPoOaQiityXnlds/LnVlvdxfT7xhap8GdTkzLbLUyjI0nZSWIsZJwetopqRZ
	3LaHM08/KYpNZws0IhyurSuF3Stk5dCm62Wb2wuWKoX3UUFgQ39Ssf7G+c9NsvgPhvAsV2
	F5Ff5Xl8ohOgPassc61yGg3IYxB71fy43pIpqC+xECp3yxEoKhWGoHkk8vjdsQ==
From: "Kyle Meyer" <kyle@kyleam.com>
To: tools@linux.kernel.org
Subject: [PATCH b4] man: Drop apostrophe from midmask value
Date: Sat, 28 Nov 2020 01:42:06 -0500
Message-Id: <20201128064206.4373-1-kyle@kyleam.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com
Content-Transfer-Encoding: quoted-printable

55913ca (man: Drop the apostrophe from the linkmask configuration,
2020-06-25) removed a spurious apostrophe in the linkmask value.  Do
the same for the midmask value.

Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---
 man/b4.5.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/b4.5.rst b/man/b4.5.rst
index d1aa251..e21ed71 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -214,7 +214,7 @@ Default configuration, with explanations::
=20
    [b4]
       # Where to look up threads by message id
-      midmask =3D https://lore.kernel.org/r/%s'
+      midmask =3D https://lore.kernel.org/r/%s
       #
       # When recording Link: trailers, use this mask
       linkmask =3D https://lore.kernel.org/r/%s

base-commit: cd94518f3eda9ec69727d9627dbd4196de826034
--=20
2.29.2

