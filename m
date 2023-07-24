Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F7E1863
	for <tools@linux.kernel.org>; Mon, 24 Jul 2023 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690186009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NawwDBEXKXDHJhmgGkt7jj/tk+aNGQDh5xoM0NWm2MA=;
	b=W98/6M6FpF5p2i7CmwCalZDTfYMkqsAatuCDHKCuxD7FcChqCfGDTplC+/gqeZIla6m2Vo
	vCWrw1tsGTx84DBwtAtneUhQdmu72GB2ku9qNmk2c5PiTuy3bp14XvorYVQQmuwCD9EPrQ
	BbkQ1EHeoLVF28JSqzf4wj0r3+Ka75M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-PA8hybmsOT-Zz9_Pzj-H3g-1; Mon, 24 Jul 2023 04:06:47 -0400
X-MC-Unique: PA8hybmsOT-Zz9_Pzj-H3g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3175bf07953so394915f8f.2
        for <tools@linux.kernel.org>; Mon, 24 Jul 2023 01:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186006; x=1690790806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NawwDBEXKXDHJhmgGkt7jj/tk+aNGQDh5xoM0NWm2MA=;
        b=J5KtW+1og2NnAPFUqy3rA3yx6NS/YSB1+WHXZfVOlDamt2ezdLk/DVcUtulfD4yF/y
         8BpZVt6Hip21YEkrnH9JoYACXCMb3Vz/OWlq+5FrVezLN0qmQQfce1KAuEFxNXmztNFi
         F6EQb4ToD+MUYoTO6MAcPXMnQw9UXq+bogU+/j9L0a0HBIfmUk14EScChzW8PMNUTt5X
         n6fKZaewySmndDDRmqsg6SJX/6/dcsR0zkkdcJ0cI2oKdGAtolIDVJ1cMJcpEwfoNL3F
         lQYoxCNsvjZJJwG5F7tp6qShVdyQVHYx1WXVO0T7m6uGWZ50gMCBKoeFd/nFWt+dAC7S
         0qCA==
X-Gm-Message-State: ABy/qLas9RNdFOgvJT5VMvNTSae3vifAXsV+k23T5d2nIAzO1YSRjLpU
	rmdifZb6a67RjxDqG3BAFZhq1fVIyUaLgWhgOwQNbTCYZnnb8qs44kIayG1IbCrSpK8Smg247r8
	D+DxPnxuEarHDhyUI
X-Received: by 2002:adf:f989:0:b0:314:4ac3:530c with SMTP id f9-20020adff989000000b003144ac3530cmr5927435wrr.7.1690186006484;
        Mon, 24 Jul 2023 01:06:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE3cj1tJ3xveLtAO77eGZ9graXEc8vavLOJCUAagfwwMYrsyQ32YEO0u/6EsB2tY+uMbutewQ==
X-Received: by 2002:adf:f989:0:b0:314:4ac3:530c with SMTP id f9-20020adff989000000b003144ac3530cmr5927426wrr.7.1690186006159;
        Mon, 24 Jul 2023 01:06:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d5492000000b003142e438e8csm12000663wrv.26.2023.07.24.01.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:06:45 -0700 (PDT)
Date: Mon, 24 Jul 2023 10:06:45 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Eric Wong <e@80x24.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Fetching an mbox from lore
Message-ID: <gjfyxgvb3s6lnvl54xaltvwkspxeqqospmf6zmbkeuzb77w7oc@z3fumfujlxlj>
References: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>
 <20230723013624.M167248@dcvr>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4fxkceerkneag32"
Content-Disposition: inline
In-Reply-To: <20230723013624.M167248@dcvr>


--l4fxkceerkneag32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

Thanks to everyone that replied :)

On Sun, Jul 23, 2023 at 01:36:24AM +0000, Eric Wong wrote:
> Maxime Ripard <mripard@redhat.com> wrote:
> > LORE_URL =3D "https://lore.kernel.org/linux-clk"
>=20
> That should be:
>=20
>   LORE_URL =3D "https://lore.kernel.org/linux-clk/"
>=20
> The trailing slash is critical.  The URL format of public-inbox
> enforces it to ensure mirroring via `wget --recursive' works.

That was it, thanks so much

I was scratching my head trying to figure it out, but it turned out to
be much simpler than what I was looking for :)

Maxime

--l4fxkceerkneag32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZL4xFQAKCRDj7w1vZxhR
xfSoAP4vXh9vFhvQ3T4EOAS19NSXfoQSuVVbnmOiIdt1fCZrggD/Y3Yd4B4wsVmc
Y/ofMh8NkrHOSwiYuYYujE7E0QCDhgI=
=yjR7
-----END PGP SIGNATURE-----

--l4fxkceerkneag32--

