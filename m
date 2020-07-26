Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by mx.groups.io with SMTP id smtpd.web10.22825.1595734879085525066
 for <tools@linux.kernel.org>;
 Sat, 25 Jul 2020 20:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kyleam.com header.s=mesmtp header.b=xfD6vXky;
 spf=pass (domain: kyleam.com, ip: 64.147.108.71, mailfrom: kyle@kyleam.com)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 5BC706AB08;
	Sat, 25 Jul 2020 23:41:18 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=urRn1u5q/8XTV28cS3bJQ6vnm
	zs=; b=YjdxGoOaY5ykBVJxZypU4NfqA0LUHui38X/3CEsbLBYNC7o1o+bS6fEB4
	IXx/ypQyl53lzP+2XQHMJkf6qF2ucgbE+uV5iqtQ8yEPktF+dfpbWd4JNrRVeHpr
	PrKVNStcbVivKpwAEN7kZoJaNyXOBG6zZycD8bZscvdcn8WJWI=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 4BEEB6AB07;
	Sat, 25 Jul 2020 23:41:18 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=kyleam.com;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=mesmtp; bh=Ck4MmQWNMIk5cawrFLbv8mQ/pG6DDx9KC2hWpvxIx8g=; b=xfD6vXkyc7hIBMqZvm9ZMvCtLH2BDldMtwhDJm1fWHBdpa4ChfvuRnR0EYdeT3zoBrbANg8SVAQW3UQ3FodIorWQ115pByv+1GqEoLk/nkOBQxB7zJ8K6etu889PTQnwDZ6z6tP4zB1A+FBgR7dLUguedQhkAzlBlpFFcgVjfDI=
Received: from localhost (unknown [45.33.91.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 8A5676AB06;
	Sat, 25 Jul 2020 23:41:17 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
From: "Kyle Meyer" <kyle@kyleam.com>
To: tools@linux.kernel.org
Subject: [PATCH b4 1/2] Fix basement detection for empty commit message bodies
Date: Sat, 25 Jul 2020 23:41:14 -0400
Message-Id: <20200726034115.21567-2-kyle@kyleam.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726034115.21567-1-kyle@kyleam.com>
References: <20200726034115.21567-1-kyle@kyleam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 
 DCD88A90-CEF1-11EA-A145-2F5D23BA3BAF-24757444!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

The get_body_parts() method added in ba6c790 (Parse body parts into
usual chunks, 2020-04-27) splits the commit message body on "\n---\n"
and takes the second half as the "basement" of the patch.  The body is
stripped of flanking new lines, though, so a delimiter beginning with
a new line isn't appropriate for commit messages without a message
body.  Make the starting new line optional.

Note that this doesn't matter in the end in terms of the final applied
patch.  Before 31f33fd (Fix body part parsing when '---' is not used,
2020-06-08), the expected patch output was produced despite the diff
lines being processed as the message body.  After that commit, the
information following the triple dash is a bit off, but it doesn't
matter because git discards it anyway.

Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index de6a274..7e3134f 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1204,7 +1204,7 @@ def get_body_parts(body):
             signature =3D sparts[1]
             body =3D sparts[0].rstrip('\n')
=20
-        parts =3D body.split('\n---\n', 1)
+        parts =3D re.split('^---\n', body, maxsplit=3D1, flags=3Dre.M)
         if len(parts) =3D=3D 2:
             basement =3D parts[1].rstrip('\n')
         elif body.find('\ndiff ') >=3D 0:
--=20
2.27.0

