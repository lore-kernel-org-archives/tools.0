Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4FB33B970
	for <tools@linux.kernel.org>; Fri, 14 Aug 2026 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786699895; cv=pass; b=ml8Ao+hZiGxCF8DV+tadZBFhDjm1QeAJFA1DGM7h8sZBSpldw1vtOKNv26CQDEsyXec7FKUbReSAUTtkDMXjU79s83m+xHE7AREv5t/vQ0BMuz8UrzGVYN7L+MmR8+LPksliDVz/fJ+wUVyAUvkGojNST7MusD2NrCd0i6GOMeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786699895; c=relaxed/simple;
	bh=BXiWfnfnl6Y336i1MaHhJop6a/++u0D5GtkRpT2CX8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q89Kv2Oy/vxp45aqLalBGmjtVwZw4dvTiRLQzpDCnbKPjPnvq8NXNLrR11hU/nhAH522HSKK06nFKDW9Vxrp/aiGJS4f0E6LUk/kP6Z8cc2FeNTc26HUGHB8INJ0pNRZf5DMQdSxBLV1CJIYns3kSdDtO1mPl29X2uPjnVh/iYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gomKmE6y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=COpP3t6s; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gomKmE6y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="COpP3t6s"
Received: by smtp.kernel.org (Postfix)
	id B4DBA1F000E9; Fri, 14 Aug 2026 09:31:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786699894;
	b=Pdu1vB8CBrjvSRu9qWjYz/iEZl30xv5jWch2xgV+xIarglNIik4qKo5uFmXkoa6SOIAQ
	 XfkLyI+No2ZLPCqqIRNqrVosSy7Cu/DhsKTzEPeJj33Qq/pEEBhNamJhae/ZZ0hd7U9l2
	 eaiDKpTfCJ2id2ToM+iAEqRrz+fxU9F6HX3XHz6V1t+xEeO2NoF9cLEpXV4P83+lLDO2f
	 k+hp4iMnpMq4RbVXkYlFC6iHZbbH4MFuxBJ7DcA14eIC8ei4yVFUJybOu4ICfubnQUITD
	 xo6kdqqagbP4tvNlAYlOeT55N8c6w2K5p0J2BxWb1l5aqgLxENjYQbNfuk3pYjb9x/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786699894;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BXiWfnfnl6Y336i1MaHhJop6a/++u0D5GtkRpT2CX8g=;
	b=pHjB47jblIyDF8HpkNjtoPYMKbny9/ea60/OBPGb1e6tyjjn/Fw882I/bY52MmHJ64HP
	 4N+0E0GPylIUUvouHKJjp1/sf48Z1JaMgJ5MEDLGcIta4KucIg8+pA+ejNUiFVcabKGuq
	 ntn4PXoKMb4qX+skarvMMQc5VD3FwzpWjUhTcHCWO8l7AXoXRSsW1fsxm5m+3dzN0IqJs
	 kB8cMmhl2BXvmbJiB74C5DJR2HXBItMm8B7jJGdzmAxDpadjzFbaNysN4IGCxCfpLe85O
	 xttz20Un+lb1M7l76VWzZAktDssa39teQwtPxfI4IfnpIDMdYBOCkCyu8mECWljPhZw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gomKmE6y;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=COpP3t6s;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1B5C1F00A3A
	for <tools@kernel.org>; Fri, 14 Aug 2026 09:31:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gomKmE6y;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=COpP3t6s
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F1B5C1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786699892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BXiWfnfnl6Y336i1MaHhJop6a/++u0D5GtkRpT2CX8g=;
	b=gomKmE6yTnDMt0qfGwab4o+gCqACqJD7P/RekxcWt3FmeCxR8qsk88iBPhYRKFvf79xAyY
	9JRRdO12It8s8am9BpXbnb5Axfkry/MzxoNsB9YZHquw2onY0UrXdTZUySanM/apkNOugD
	rcNZH36V4OA0s2BuzBO7BREEYOnvdPg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-W933d9O3NxO5TTk_AtVrdA-1; Fri, 14 Aug 2026 05:31:25 -0400
X-MC-Unique: W933d9O3NxO5TTk_AtVrdA-1
X-Mimecast-MFC-AGG-ID: W933d9O3NxO5TTk_AtVrdA_1786699885
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49554715277so6492775e9.1
        for <tools@kernel.org>; Fri, 14 Aug 2026 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786699884; x=1787304684; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BXiWfnfnl6Y336i1MaHhJop6a/++u0D5GtkRpT2CX8g=;
        b=COpP3t6s5vbub4smH1mtvRh/nFrO5GiykrsRc3WurFnobRvMWbohCgwhw+agPN+a7y
         7vkVDDSLgGB+sRtKJ/kbd2xUkDPrwasnoRkwJgukAh6gMHqLLr9eqW/Og6AjHJwYeuXA
         O1e737g77C+kmvjUT9UhRGGGIOyHQ8pAzlCxKxoh6lenFdJJAAP0otG6DOfzmKwsGkiR
         uJz2oUsoyITQmL7J2p8nGGkFjzt/n1TY1kqpTj1K6OxpfwFEJNPcMRnLu52OoPGVzTEQ
         nICOfueLwYXkO1uRPM90KMLbsIxjGhRlKiY6jlQjzQc9pv414YDpvcNo0e7vi+5OuNW7
         8hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786699884; x=1787304684;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BXiWfnfnl6Y336i1MaHhJop6a/++u0D5GtkRpT2CX8g=;
        b=ow8glzkAOjZO093z4UZI+GSQF0U7ivCTFyYWROmWbPQCD7SV3p29V3v0LzW/Y9UN9m
         LyEK2nZ8vx5G+edL22+o521pnybifVCjZCzluSTf5si26LTmjp84h9Ns/Teo+DMTweBf
         aUGbWzANnELLOcPrK/m/o9I8JP7gVVF3cSbRj4e38emtoSBxbU4gwlolMTPhQhoBM0cz
         d+eQID/BFUMc7Dxr91bUtmM7HBGDuJxRsbZI6+b1c0EEz3gAOyjZKKavVHCGooIFRb0J
         j5pIh6jBcbt7W7+6hvSUf/CW8F/AX/hf2WKvqcwcaesU3EDKZI8PZZlHJQgvQzbpsFZ7
         aQSQ==
X-Gm-Message-State: AOJu0Ywt6NeoFvxqll5FT7y8o/8Na/3gLOCITjiRPbCcZVYDLMNubmuM
	rQxXr62YxjJtJlzYQKaFkGeQdI99x+a44PDh1UOm8luoxDguYt9FJ3LXFm3CNBo7aHT7IemjoGN
	cVAZJ087hiT9BbpbEkzKmoefBSpZvzmugNWsSbRjhPKxnq48ZFg==
X-Gm-Gg: AR+sD11gLBugS3WcK4d3gvdXjGXgungDGyk+XB/L/QlkGEs5L/3oLF7WZ+feQdcDhPO
	k3rkHkMojubfddMdoER7o0QMp3ing00KcKUoOwcwqv2sGktvA3+ZEMy1vK/32b4mjL3KEnyDCHA
	82epapGUxADSRDWxUOtQ2VOiPN1cirxOlZ2G5kNXo8/TOrNIgY+R+O9+RtZG9olYwdJcSPwrXT3
	9MJP6+gKcjFayLFk+q51inDY+i1NBhD4M373Ex2+4Zm3wvP11QKaECQQaxcZXIADw7lixLfbbDJ
	VCvgtzAl0VXgtviIFfsO8OMtCCGn95EWoMMJb6lpQU0eKn8GxFJKrBzieKsAPxwnauMvoln2YQ=
	=
X-Received: by 2002:a05:600c:6c4d:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-4998799df10mr38403915e9.14.1786699883796;
        Fri, 14 Aug 2026 02:31:23 -0700 (PDT)
X-Received: by 2002:a05:600c:6c4d:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-4998799df10mr38400565e9.14.1786699883072;
        Fri, 14 Aug 2026 02:31:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:ca7f:54ff:fe01:374c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899afa39sm17501305e9.2.2026.08.14.02.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:31:21 -0700 (PDT)
Date: Fri, 14 Aug 2026 11:31:20 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4 0.16.0 released
Message-ID: <20260814-vengeful-smooth-pronghorn-cc6ded@houat>
References: <20260805-alluring-arrogant-grouse-ece17a@meerkat>
 <20260810-urban-hamster-of-brotherhood-0b9bb2@houat>
 <20260810-amazing-woodoo-mink-af1cdf@meerkat>
 <20260810-magnificent-precious-frog-f3d1ca@meerkat>
 <20260811-honest-python-of-fame-c3ddbf@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="65qdzl3pusvlzahb"
Content-Disposition: inline
In-Reply-To: <20260811-honest-python-of-fame-c3ddbf@houat>


--65qdzl3pusvlzahb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4 0.16.0 released
MIME-Version: 1.0

Hi

On Tue, Aug 11, 2026 at 05:15:16PM +0200, Maxime Ripard wrote:
> On Mon, Aug 10, 2026 at 03:08:28PM -0400, Konstantin Ryabitsev wrote:
> > On Mon, Aug 10, 2026 at 11:47:21AM -0400, Konstantin Ryabitsev wrote:
> > > > > Full release notes available here:
> > > > > https://b4.docs.kernel.org/en/latest/releases.html
> > > >=20
> > > > It looks like the tarball hasn't been published? Is it on purpose?
> > >=20
> > > Oh, sorry, I forgot about that step! I needed to first make sure that=
 the two
> > > new libraries have tarballs, too, and then got busy with bot wars.
> > >=20
> > > I'll set it up today, thanks for the reminder.
> >=20
> > All tarballs should be in place now.
>=20
> Thanks, I did the Fedora new package requests for the two new libraries:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2513852
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2513973

For both (and b4 itself), rpmlint reports that the license in the
COPYING file mentions in the copyright an outdated address for the FSF
(51 Franklin Street, Fifth Floor, Boston, MA).

It hasn't been in use for two years
https://www.fsf.org/blogs/community/fsf-office-closing-party

And the FSF now recommends to drop the address, see
https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html

Maxime

--65qdzl3pusvlzahb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCan7gZAAKCRAnX84Zoj2+
dh4bAYDdgQaGviVAM1QPQaBOpo/E1dKImKRf0cWyF699an8RcuGEzp/8/DBPuw+t
TmIv8zcBf16ECpGcRB2mWhTE+4A/XDRYn8LT04rr66/h9+V9E56BfxHWzUGswXkN
vYpnGfMlJA==
=6xGR
-----END PGP SIGNATURE-----

--65qdzl3pusvlzahb--

