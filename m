Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6C67F
	for <tools@linux.kernel.org>; Sat, 22 Jul 2023 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690045958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=GS8P4hnfLkziERKtpuVaCNediTiiv2XYVe+wPHBV2q4=;
	b=UYBq2KlB+/EKez5oR5vu/wNq7oywMRGzAYp4bzb8fCpsWOoFgdTfE/tqrfsVjyf5yssJPX
	YgVfE9SPc9K12NmpnOsXroGtFXNV9XjtV5Y37c5eGmj/IEmTA7sh8Rm+EH4VplJtvCLnWD
	tP9i9rpoVLvnSG9ynvfPMe2y7QSLWJ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-0wyHPYunNoK83S1LWezJXQ-1; Sat, 22 Jul 2023 13:12:35 -0400
X-MC-Unique: 0wyHPYunNoK83S1LWezJXQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-314394a798dso1464502f8f.0
        for <tools@linux.kernel.org>; Sat, 22 Jul 2023 10:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690045954; x=1690650754;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GS8P4hnfLkziERKtpuVaCNediTiiv2XYVe+wPHBV2q4=;
        b=C0YkgU+uPF4aC0IhW0OQW31CC3ps4JiToH7HR9xyUmwp4WHlZ0nUUpLJ+Nox08dsnf
         05+wNlGZ0NPgQLzH26aC4T8Jc/ugjdF7SJovP4znXjWNgz/tOzGCJiBw2ACmCL4awjrD
         lIonNw7SpBLYTP8gJ5vwrBla4FTZOPTFfQJY0xGiBpXd1U5K3sgSnnMIscxs+xxAc54e
         /sgI96SYN7Pz+YVNGYqlZDU/NaAw7vTytqgJA7m5q9cVKZFAbeD8VNyZQFK9+3GGXDp2
         PuyPLQhb9N/DgAajEGLg+Eddowa3g2Mq5z22+7CMyC4mkOOuVpci65Mj8bZisUmwqxdQ
         vZ4Q==
X-Gm-Message-State: ABy/qLbH6YJbm0leVL+v7FNkdZBfWQUdHOPyKA+GBB7/Wbsxey7NmQ+4
	anvyinuW0/xiMSrCBwPEU/+rOEH1XzMwzrl3rLijmOFJ6T8DgtJDbW2zgzilPCujAVtDQ5Azr5p
	8pGN++MaMEeK+1Iy/
X-Received: by 2002:a5d:4a0f:0:b0:314:323b:9d3b with SMTP id m15-20020a5d4a0f000000b00314323b9d3bmr8626157wrq.32.1690045954801;
        Sat, 22 Jul 2023 10:12:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEQAwWBv2I80rcWXcOM5Iv1YnoJEr9w+1OfkJOisbEI+5SA5bOjSAdnCNffQhqJYiVlkP15mA==
X-Received: by 2002:a5d:4a0f:0:b0:314:323b:9d3b with SMTP id m15-20020a5d4a0f000000b00314323b9d3bmr8626152wrq.32.1690045954486;
        Sat, 22 Jul 2023 10:12:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id a12-20020a5d53cc000000b00313f9a0c521sm7358236wrw.107.2023.07.22.10.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 10:12:34 -0700 (PDT)
Date: Sat, 22 Jul 2023 19:12:33 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Fetching an mbox from lore
Message-ID: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jon5celnvzm2zjga"
Content-Disposition: inline


--jon5celnvzm2zjga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've been trying to fetch an mbox from lore with an arbitrary search reques=
t.

I could fetch it fine using curl with the following example:

curl -XPOST -H "Content-Length:0" -OJ "http://lore.kernel.org/linux-clk/?q=
=3Dd:1.week.ago..&x=3Dm"

This returns a gzip'd mbox, everything's fine.

However, for some reason I can't duplicate it with python's requests
API, and it looks like I get redirected back and forth between HTTPS and
HTTP when I try to connect with the following script:

#!/usr/bin/env python3

=66rom urllib.parse import urlparse

=66rom requests import Request, Session

LORE_URL =3D "https://lore.kernel.org/linux-clk"

def try_url_redirect(url):
    headers=3D{"Content-Length": "0"}
    params=3D{"q": "d:1.week.ago..", "x": "m"}

    s =3D Session()

    req =3D Request('POST', url, headers=3Dheaders, params=3Dparams)
    p =3D req.prepare()

    print("Trying to connect to %s" % p.url)

    resp =3D s.send(p, allow_redirects=3DFalse)

    if resp.status_code =3D=3D 301:
        print("Redirecting to %s" % resp.headers['location'])

        url =3D urlparse(resp.headers['location'])
        url =3D url._replace(query=3D"")

        return (resp.status_code, url.geturl())

if __name__ =3D=3D '__main__':
    code, url =3D try_url_redirect(LORE_URL)
    try_url_redirect(url)

The output is:

Trying to connect to https://lore.kernel.org/linux-clk?q=3Dd%3A1.week.ago..=
&x=3Dm
Redirecting to http://lore.kernel.org/linux-clk/?q=3Dd%3A1.week.ago..&x=3Dm
Trying to connect to http://lore.kernel.org/linux-clk/?q=3Dd%3A1.week.ago..=
&x=3Dm
Redirecting to https://lore.kernel.org/linux-clk/?q=3Dd%3A1.week.ago..&x=3Dm

If I do allow redirects, then requests will issue a GET on the new
location and I'll end up with the HTML webpage of that request.

Am I trying to do something not supported here, or is it supposed to
work and my script is wrong for some reason?

Thanks!
Maxime

--jon5celnvzm2zjga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLwOAQAKCRDj7w1vZxhR
xVDjAPsE5JbaQNvGX278vNcf/k2g7opI0QrooagAy857Xl8rMgD7BT4VWuQFgNO/
RqN/oLS8IIlLIl1acuiASHK0t6UMEAU=
=j8/l
-----END PGP SIGNATURE-----

--jon5celnvzm2zjga--

