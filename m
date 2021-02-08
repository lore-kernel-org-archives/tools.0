Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by mx.groups.io with SMTP id smtpd.web08.31120.1612757258063458323
 for <tools@linux.kernel.org>;
 Sun, 07 Feb 2021 20:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kyleam.com header.s=key1 header.b=Xz40t+Ya;
 spf=pass (domain: kyleam.com, ip: 94.23.1.103, mailfrom: kyle@kyleam.com)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1612757254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QmBt92YO9gJOg8rF/gVr6F+BOT8zL9IyDGQAubQEZcM=;
	b=Xz40t+YajGED53Ecf4p29gXsty6xmV4AKIs/Xn4EzKa36CX1kaGPy+qdRTjNog0ykIV0l4
	mc3zSSmOhqttNtiUwUGtTlNWS52KfAQfYlcg3s5L62nQNIyEHQFyeA0R3rIv8k/qNvsXTH
	6zWeB+cYeHLWJx4/EtaHKUtle2BUPpn/ZqG5X5WrXG8FQ9Iet6IrmKrDIYNbk3ZDyGdJwp
	608JefzLhZyqP0pliz5BQnBUnyBKKMK6aXNY3eJAI/33qGgPHJbIDLSLx4ne3BZIePfnhm
	afg/2iq8qQLiQ8ca7Vve4B8CYMOrFVXh8c3FUI0Zl/Z+wGoqN7UP/R6CaQFZZg==
From: "Kyle Meyer" <kyle@kyleam.com>
To: tools@linux.kernel.org
Subject: [PATCH b4] Delay dns.resolver.get_default_resolver call
Date: Sun,  7 Feb 2021 23:07:22 -0500
Message-Id: <20210208040722.31203-1-kyle@kyleam.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com
Content-Transfer-Encoding: quoted-printable

When b4.attestation-policy is 'off', calling `b4 am` with
--use-local-mbox is conceptually an offline operation, but it still
requires being online because get_default_resolver() is called at the
top-level of b4/__init__.py.

Support offline operation by delaying the call to
get_default_resolver() until it's needed.  Note that
get_default_resolver() already caches the result, so there's no need
for b4 to store the result as a global variable on its end.

Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---
 b4/__init__.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 17fae0e..49304fd 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -33,10 +33,8 @@
     import dkim
=20
     can_dkim_verify =3D True
-    _resolver =3D dns.resolver.get_default_resolver()
 except ModuleNotFoundError:
     can_dkim_verify =3D False
-    _resolver =3D None
=20
 __VERSION__ =3D '0.6.3-dev'
=20
@@ -1703,7 +1701,8 @@ def __init__(self, msg):
             ddata =3D get_parts_from_header(dks)
             self.attestor =3D LoreAttestorDKIM(ddata['d'])
             # Do we have a resolve method?
-            if _resolver and hasattr(_resolver, 'resolve'):
+            resolver =3D get_resolver()
+            if resolver and hasattr(resolver, 'resolve'):
                 res =3D dkim.verify(self.msg.as_bytes(), dnsfunc=3Ddkim_=
get_txt)
             else:
                 res =3D dkim.verify(self.msg.as_bytes())
@@ -2448,13 +2447,19 @@ def validate_gpg_signature(output, trustmodel):
     return good, valid, trusted, attestor, sigdate, errors
=20
=20
+def get_resolver():
+    if can_dkim_verify:
+        return dns.resolver.get_default_resolver()
+
+
 def dkim_get_txt(name: bytes, timeout: int =3D 5):
     global _DKIM_DNS_CACHE
     if name not in _DKIM_DNS_CACHE:
         lookup =3D name.decode()
         logger.debug('DNS-lookup: %s', lookup)
+        resolver =3D get_resolver()
         try:
-            a =3D _resolver.resolve(lookup, dns.rdatatype.TXT, raise_on_=
no_answer=3DFalse, lifetime=3Dtimeout, search=3DTrue)
+            a =3D resolver.resolve(lookup, dns.rdatatype.TXT, raise_on_n=
o_answer=3DFalse, lifetime=3Dtimeout, search=3DTrue)
             for r in a.response.answer:
                 if r.rdtype =3D=3D dns.rdatatype.TXT:
                     for item in r.items:

base-commit: f93bbd3e50b1fb4507aa537f4004da545af9d890
--=20
2.30.0

