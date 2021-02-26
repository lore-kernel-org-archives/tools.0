Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by mx.groups.io with SMTP id smtpd.web08.4930.1614313582967948306
 for <tools@linux.kernel.org>;
 Thu, 25 Feb 2021 20:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kyleam.com header.s=key1 header.b=MwOsnQB3;
 spf=pass (domain: kyleam.com, ip: 91.121.223.63, mailfrom: kyle@kyleam.com)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1614313570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PKI8wkEVs+a5S6/CWOUcEFc27p2Dk1y16GPldbwoj10=;
	b=MwOsnQB3ADAabPXBaPBCfoaC9DDC51PwlNMpuh7dLWLas+AhbHnbS9hWidi4K8ar5DMEgv
	Q99GfH2Mf11nnxa/urTZQ0c1TsUVL2f+1ffdHJX8rOOBntCpJeK6xpvnb0rfeEMWM+UKwt
	m4u2Uu43rcT5i+IYggOGP32FLEPTT1m9WwC/JfEk2KAf6Ej7+tFtE1OKUVvvj8S11URSRl
	j6T1CyyEIvK3aEWQohvXq/010E/wSbjZ1qaA21nrqOO6unGEoKLmBYXduyooWWNh3vxaEo
	9VnYUHle0H1O8i37RqvBoZvexafsUo75hE5oefl80H6yjqNb80ut8maYuVDiBA==
From: "Kyle Meyer" <kyle@kyleam.com>
To: tools@linux.kernel.org
Subject: [PATCH b4] Loosen compatible release identifiers for install_requires
Date: Thu, 25 Feb 2021 23:25:57 -0500
Message-Id: <20210226042557.19210-1-kyle@kyleam.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com
Content-Transfer-Encoding: quoted-printable

The install_requires entries use a compatible release operator.  As an
example, "requests~=3D2.24.0" maps to a requirement of ">=3D 2.24.0 and =3D=
=3D
2.24.*".  With the current version of requests (2.25.1), this leads to
a ContextualVersionConflict failure at runtime.

Allowing only Z to tick in version X.Y.Z seems unnecessarily strict
unless there are known problems with a particular release, and it
makes it more difficult for distributions to package b4.  Drop the
trailing digit from all of the version identifiers, allowing both Y
and Z to increase.

Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---
 setup.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/setup.py b/setup.py
index 358e6a7..a21ec76 100644
--- a/setup.py
+++ b/setup.py
@@ -41,9 +41,9 @@ def find_version(source):
     data_files =3D [('share/man/man5', ['man/b4.5'])],
     keywords=3D['git', 'lore.kernel.org', 'patches'],
     install_requires=3D[
-        'requests~=3D2.24.0',
-        'dkimpy~=3D1.0.5',
-        'dnspython~=3D2.0.0',
+        'requests~=3D2.24',
+        'dkimpy~=3D1.0',
+        'dnspython~=3D2.0',
     ],
     python_requires=3D'>=3D3.6',
     entry_points=3D{

base-commit: f93bbd3e50b1fb4507aa537f4004da545af9d890
--=20
2.30.1

