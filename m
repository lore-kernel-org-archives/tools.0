Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by mx.groups.io with SMTP id smtpd.web12.23052.1595734880630797906
 for <tools@linux.kernel.org>;
 Sat, 25 Jul 2020 20:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kyleam.com header.s=mesmtp header.b=aZ9AQi0s;
 spf=pass (domain: kyleam.com, ip: 64.147.108.70, mailfrom: kyle@kyleam.com)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 89D4F7F0E7;
	Sat, 25 Jul 2020 23:41:19 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=RYwbhf5ivG48u4xesYEVtS9nd
	MQ=; b=USGCKbAK9HuvFfthJfoqoRleYhCaIfi+Qz8f0Dxieybg9LOyFEwxRAK03
	jRfiWhNeAOPLwFL/r9+4YvCyS8BWEOceKoVXJA1JUhwziLV/rk3h16Wwd4rux+M5
	o8q3vHDkNiavj9NbLJ3AO1a0HPv1RF9wNuef0LJMdHCjkVao+c=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 813E07F0E6;
	Sat, 25 Jul 2020 23:41:19 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=kyleam.com;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=mesmtp; bh=U6yKKD1/9T78qHaSy6/Kd+mWk1g2oWcRD0jOPNSQMKk=; b=aZ9AQi0sJ4FXOmcMbA1tyTeaEpQ3MPHKsPQ3xGjuyW4qHx/ofjr3rj7vLtPq/ZNoP/ZyTW1GNUj5ted/G3WeRJFNQ9quyhvCZIfdg7DuYaW/XphkFiMiZRq3kVbcMGslcUhwXxlC9EU0VErPWGVYyprPo2ZoS/EpC0BjqqnDYXE=
Received: from localhost (unknown [45.33.91.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id AD21D7F0E5;
	Sat, 25 Jul 2020 23:41:18 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
From: "Kyle Meyer" <kyle@kyleam.com>
To: tools@linux.kernel.org
Subject: [PATCH b4 2/2] Fix handling of single-paragraph commit message bodies
Date: Sat, 25 Jul 2020 23:41:15 -0400
Message-Id: <20200726034115.21567-3-kyle@kyleam.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726034115.21567-1-kyle@kyleam.com>
References: <20200726034115.21567-1-kyle@kyleam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 
 DD86F206-CEF1-11EA-858F-01D9BED8090B-24757444!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

The get_body_parts() method added in ba6c790 (Parse body parts into
usual chunks, 2020-04-27) strips lines that look like trailers from
the last paragraph, storing the other lines to add back to the
message.  However, if the commit message has only a single paragraph,
get_body_parts() returns early, unconditionally returning an empty
string for the message even if non-trailer lines were encountered.

Return the collected non-trailer lines, if any, as the message.

Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---
 b4/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/b4/__init__.py b/b4/__init__.py
index 7e3134f..b7b33f4 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1241,6 +1241,8 @@ def get_body_parts(body):
             if githeaders =3D=3D trailers:
                 # This is a message that consists of just trailers?
                 githeaders =3D list()
+            if nlines:
+                message =3D '\n'.join(nlines)
             return githeaders, message, trailers, basement, signature
=20
         # Add all parts between first and last to mparts
--=20
2.27.0

