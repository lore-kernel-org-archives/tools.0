Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840E25D531
	for <tools@linux.kernel.org>; Wed, 12 Feb 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379052; cv=none; b=TYHgY28rAUKSlSm2kc351m6r9Stgx86TEtSXI9rdmMGEkBOzkhDr3Jzt3o2kdABB4C7WoGtHx5DMqzkcN88UAfCs46MvdhMkizDgUf6/0vAT9r1XEQ1i6KQHSOFWX+llFd3TuSRUdM7FO/v1G5V4MO3JgaaaS07/O+uCYiW8KZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379052; c=relaxed/simple;
	bh=Ony9m30LQFNc5lF5ioYbITQRDWj2iDYN9BEl/csMkOU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYYge4T7yNPqtAi7ExM4AmUz5Q4ExNjRa3IzgwW5ZLXLh2MK8i05Gsk+ZZM0kVwLQ/N/Cqmuzdr4r7Tqg6baucG400Wuzgnmv03poWMT5TRN1mLivzlvMEDPK55o8BzvfSdBNwiJMbnFS7O5RGW1QtP+8RDZL/0YmdS0rjgfMsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=e/9ljXwB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="e/9ljXwB"
Received: by smtp.kernel.org (Postfix)
	id C4331C4CEE5; Wed, 12 Feb 2025 16:50:51 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEF7EC4CEDF
	for <tools@kernel.org>; Wed, 12 Feb 2025 16:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BEF7EC4CEDF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-471a01060f3so13128101cf.0
        for <tools@kernel.org>; Wed, 12 Feb 2025 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739379049; x=1739983849; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ony9m30LQFNc5lF5ioYbITQRDWj2iDYN9BEl/csMkOU=;
        b=e/9ljXwBtNOedwIx10x/8c2ezX1euSv4MHJg9kfnMpam40zG8VvODw5tHLkueeH8oN
         /aPDvEqAwz43wo3MTMC/D7EEtOyqc2DY+yxPqYR4JZnOnLDJVrq9h8GtvF0A7pDQq2Vz
         Ku3bcY0rDdO/xbFcNzfn2iKV53PaKF8KKlkGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379049; x=1739983849;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ony9m30LQFNc5lF5ioYbITQRDWj2iDYN9BEl/csMkOU=;
        b=eBTWlQoESsw/ciRslcsZ/EuUEQ1vU1Scql8YW460iTrfkiu5YlnKbQka6ZOG9SCiAV
         mJq0sZqBY/gNehEKOvkbhQlTEUredoEHKHM80aZ7ddbh3yl67oRy6fPBGSJd5xgHwcK+
         WY++tp5GPW2zyxqq1GpFfALGJr5jHqOpghfbJ4n6Qr4ULcdgCteDkqcEvr3WqMyHBV7L
         jVcPTqS2lm0PcetJs2QN6ejdmZNsdAfgzLkZez5jLT0UZ841b2XpkiT5yAWc/oLvzLLg
         Bj2AFEzOuNrtpNrU9nY4hvGW4C0MM/10m61v6RhRR4CFqCsgQ8x3984IrFdZRW0V4U2a
         qXIA==
X-Gm-Message-State: AOJu0Yy4iD0V0DqNhMwcarbVeOTz999DIpbOGokoaEA4o7i+eyIMyJ8K
	ZzYWrAHGSWXPqlnuZVoHzniOPlzcCcqC0WsRQkMY7iIVCz62V6kxRhPmQpWIBU55FaLCaOJceJt
	/
X-Gm-Gg: ASbGncsEdHDCRdcM4RXJuqkojINg4uYW90MVq4h0Asl/4Ch2U93VIOGesr0LVQPyRNB
	sVM9DBmo27ElA+qXTuofBA7fcCxCq32XPt2F1eC/BJIk6xuiP7dppj2AYl7Iz5dco8mNN9Km1gw
	W5OIyXRxkCUP8SaKYsd4BMindbNc7PoYR0wve74ratSAiD9s3G8g0EJn09VuNgJnfRYmwNg+R5I
	HpHHDMzOc9/musDFqNo0CLJB80UydgINcWw10qcfGIeHRkphO5ongwUaQvGHPZEtNJf/cB3/Uh3
	hgiWmfvUZbAvqes=
X-Google-Smtp-Source: AGHT+IHXcllhq7+23MOdYwTNsOghWeMMugBh9db5MLiRGlHhyeTo0tV3opFxtNSKaHeTeoWXjiUPbQ==
X-Received: by 2002:a05:622a:8e05:b0:471:b546:905f with SMTP id d75a77b69052e-471b546931cmr26984131cf.1.1739379049441;
        Wed, 12 Feb 2025 08:50:49 -0800 (PST)
Received: from bill-the-cat ([189.177.145.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4719e591a62sm32391041cf.73.2025.02.12.08.50.47
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:50:48 -0800 (PST)
Date: Wed, 12 Feb 2025 10:50:45 -0600
From: Tom Rini <trini@konsulko.com>
To: tools@kernel.org
Subject: Problem with "b4 pr" ?
Message-ID: <20250212165045.GP1233568@bill-the-cat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JG6EEc8ve9NCdm2l"
Content-Disposition: inline
X-Clacks-Overhead: GNU Terry Pratchett


--JG6EEc8ve9NCdm2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

With:
$ b4 --version
0.14.2

When trying to apply this PR to U-Boot:
https://lore.kernel.org/all/7caf7a0a-c2ed-420c-afc7-620ab11461b5@linaro.org/

I get this error:
$ b4 pr 7caf7a0a-c2ed-420c-afc7-620ab11461b5@linaro.org
Looking at: Please pull u-boot-net-20250212
ERROR: Could not find pull request info in 7caf7a0a-c2ed-420c-afc7-620ab114=
61b5@linaro.org

I'm unsure if this is a parsing error (as I've had "b4 pr" dislike
git@host:path URIs, but I've told custodians how to setup a url and
pushurl to avoid that) due to the trailing / on the repository, or an
oddly phrased error message because the commit in question isn't in
u-boot-net-20250212 but rather then "for-tom" branch.

Just passing this along, thanks again for the very useful tool!

--=20
Tom

--JG6EEc8ve9NCdm2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmes0VoACgkQFHw5/5Y0
tyzDPQwAs7p8cD3jYWUZMzDV1h3kQQHG/vOaJd1laeypokv45m78FND9q13B/aDe
2CPGVUPRvc0iRKGU3QNs/m2wOC2GubHGd00oBQXsyhCYO5gKra+RaETtmPVdNGHr
Oy/1sVyfoP2ryj8Cly2/zKzaarCkSlTM974eWKYOFZENiLEAdjz365KMp4eJL/lU
wvBwt7uRdubVG5v8L0K2w/aZIawgJykowfwyoE2OIRsdWUKBLhns/Owhcj2U4z6S
81oXb5yZljFEDm2qi9nRITCpBkXe7E/WF5XfpIdE6w0jH6gDQVsPqjV6EhkAkNKT
2cZp1iPVAeeYH7vxW3h3ZYXSXqxPCaBB21ZiFzx8PM3rZoE2dehdvtTWotWZAAFm
UW7N3mBqepYnafn4WGmRf0QeET/OMROj8j0QYsd1EuH5GfaqL99KVc/rgMrtqBdy
2iWbVeocqrRMdp+CCgT24wzGA4wxWjn7J2dUUZR1oND52d0lQJg1eTzZYDVK6kPx
NYzoU9pO
=38+A
-----END PGP SIGNATURE-----

--JG6EEc8ve9NCdm2l--
