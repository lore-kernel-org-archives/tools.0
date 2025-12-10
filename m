Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9B28505E
	for <tools@linux.kernel.org>; Wed, 10 Dec 2025 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765385447; cv=none; b=G1MiFxidV4S2OUuJCcVfygtY0asGn3VBzQKkqa6JJ1ZE/HOPVFnz+binDpBfJVHEmle4zA/TSny5OcKEkRA1oKfp0DQRrALmw1He3KYui5OSM556w1VjMSYrtiDB7FE22UQsYugj+fTBGA8Q0pzsxiUw4UhfCsuHPSsWkheLw2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765385447; c=relaxed/simple;
	bh=NaDt23Ukl91/F40RAIYGqVqzKPDaGDX8qyw3Ui6EPNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeYqpT6f8AvQ/DbADNI2SzbM0QUV6bEWgtvhKPIQCHcmsV3l+5Erpm7/GV+T8EE8PWoC55rVeEw1a/4RvMU6kOB5zWWG4qsdyAGQHIi/IEnxHavV23Yscz+pVUOor5jOz4M0+HVA3XahoWdL1SO1uN+QgfLxB3MexPJ5dO79fnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=jh/AxFCS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="jh/AxFCS"
Received: by smtp.kernel.org (Postfix)
	id 379A0C16AAE; Wed, 10 Dec 2025 16:50:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A959FC4CEF1
	for <tools@kernel.org>; Wed, 10 Dec 2025 16:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A959FC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-298456bb53aso1001195ad.0
        for <tools@kernel.org>; Wed, 10 Dec 2025 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1765385445; x=1765990245; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Il+LSnejb2zoKNKtmn4km8qN8DJt6MEE3ZHwaYHHnJM=;
        b=jh/AxFCS9+TqbqfP3H4YL7/zuCBLPHpAjaepwVT2vDPPazYdYe9Cs/rQV3+uiQqcQQ
         ZP6W+zrSGrCLDamZxIUu25BgwEsIL7FyalUbowd5xO20aQc7A/bNRbCVppUA66Noh9qy
         DoWHYZiIOI+JSxdfRzUsVyyAmeK2WtEeRGM1VBZu7NRo9tBLqBt8Ssq5J9keVFT1XvQs
         KapHoabHdd3kbA7zJ7INKKI6+GyhVdEmlyTjyj5jBy4Gu/kp/0ZNZF5JyWbx81y8l2Zy
         atFHqsddRoGsnQYLLVdMgziQDuz5UqqUTkSFavSq3A++ijkDcQ5Y53Sh+tMgh4P2A+Og
         YLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765385445; x=1765990245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Il+LSnejb2zoKNKtmn4km8qN8DJt6MEE3ZHwaYHHnJM=;
        b=v0zyLQPMTdlYmqVtYOnGFk1++43kT+B9gOGuUrPN9KDzmiI2vqPiIfzBUMF8ToLF48
         aE8L+J5BBhRHZZMha3papnt0W75UFXv9DzHgdLSAHQWuo1RI/Bk5RySn0ttN/4QgvzpV
         DzB5OVqSnGAO0li5zLd99QkDMIH+/7wHBwn+F84+Spi8H7i2Ab+1+oMgC14PswD3tkyW
         Lyk/kOu6YLgBsLw+g3HYsZuwbi1jDmnIuV9Xflta3tMJiqL1C9Gz8mXOIzdx6ibw6mCt
         mcYiqsNHsSYNGLg+DI9v6mxnTFVXsgPT3FUQD/IhnI05TS8bB1rGBjBO5dr/y2rKL/yK
         kdrw==
X-Forwarded-Encrypted: i=1; AJvYcCVmXFzLHx/JekjjPAt+uoJSqgj1HELeUFipshiuuBMoIjuCQEvIwKMk2a6KmGhS9BwBNK32Hw==@kernel.org
X-Gm-Message-State: AOJu0Yxg02VNaqa8lBp1Z6zy8Dkz3iEMGJK+cF9n5xwHdOcRSI9GhDng
	RiCwxXW0Xm7ulFRZOZMoqQeBVnGBSWOquGpkFGd05jqwLLDXie2VgoEkqkU7qDogPC4MuXuC8nM
	jAvHA0Hy+oLzVZcmUaal+9Fgpg5Y0lwWvzRU+Iu0E
X-Gm-Gg: ASbGnctDB2+PcijxKYYqJ/JjloR1CfoehfDRXzKnKbh1cPqCUrNHeuKSW8Evn7a+jI7
	AlQl8JOTKIDTpeuZYxF0VOe8rB9NaFGpRbE3ofdGqSgIbXAAhPvnJLruTk2qMRImJetizTwDj3e
	LXdNX+ptNXVU6cVMzrU583TWrzPqFFwYzgCSCy+JNSjdiKwsIUunECcyyTB09ZQgFbrYCi+hncn
	48hqB2qP922CybZY2LfLhXoWWPXN8SIHJTDyaUG2pLXNgbfb7B2KW2sRJPJef5FdXSad1I=
X-Google-Smtp-Source: AGHT+IGzHxlpYBgJeARMIqF3hrLN+RU2slpVMDSbg14NArQeqPTk+uM/TfDMIyikxJ+IhMCXD+Nqxy5ij/ZALWgcc74=
X-Received: by 2002:a05:701a:c963:b0:11a:37a7:3d2f with SMTP id
 a92af1059eb24-11f2969f05cmr1728192c88.37.1765385444678; Wed, 10 Dec 2025
 08:50:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <aTj6C69JzDUJUVP4@sirena.co.uk>
In-Reply-To: <aTj6C69JzDUJUVP4@sirena.co.uk>
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Thu, 11 Dec 2025 01:50:07 +0900
X-Gm-Features: AQt7F2pZJv9uDItPsuNKepIWhUIu5JbM5pL-ButzctEptaVqAWUwRO2V_lw9Q7s
Message-ID: <CANgtXuMHo2heKG4zRSM_qeP6NpQGEPE+DNUexenTrN1eV0-LFQ@mail.gmail.com>
Subject: Re: b4 pr checks for KernelCI results
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 1:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi Konstantin,
>
> It'd be really handy to have integration in b4 for querying the KernelCI
> APIs for test results when both sending and pulling in PRs to see what
> the testing state for the head commit for the PR is.  There's some docs
> for the API here:
>
>    https://docs.kernelci.org/
>
> Possibly this could just be pointing at the dashboard if there's result
> there, that'd be a start - there's a bunch of UI issues with starting to
> get more complex.
>

Hello everyone,

would be nice to have b4 integrated/using kci-dev (the official
KernelCI client tool)
the documentation is at https://kci.dev
https://github.com/kernelci/kci-dev

--=20
thanks,
arisut
