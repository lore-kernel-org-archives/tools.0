Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF623FD1;
	Tue,  5 Oct 2021 12:22:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D06316117A;
	Tue,  5 Oct 2021 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633436535;
	bh=nVno1XER7rtjRaq1NqpptpgjnPfJksaRaNdbqGAiRwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gO1vHa+8jGdaQ6N4npj8vWOqqp9hq1ATSWX9KzhigEOk9XeDl+r9n2673ED1fWawt
	 fzHVx7GD1+kh7lH7RGquviK4FQNoFGP960vpEMiBevqpw9O+AH8uAJRK7KRAjo32Sl
	 ayAWzYzMcg4vt9olgiPwbZveoEaFaLbSHshWv9Inhm3hYEtxRXoCfVBuxSYP/m7uro
	 O48Dz9rb4EzhT/OEjieG3XI2HlCnJ3OaNyiSJ/FiNnMPUvqbnKkOZAp9cKG9ELLyhC
	 MdaFcMbLQD1obsi87xdqvbTsP3xIaMoDHH7KEkJo4JoxLjGRDQVdpF76w2uGnFx2+I
	 bXTlcgeQum+tg==
Received: by mail-ed1-f53.google.com with SMTP id z20so26329095edc.13;
        Tue, 05 Oct 2021 05:22:15 -0700 (PDT)
X-Gm-Message-State: AOAM5322WNsYJCyRrBOTyomL2XFL3kTEmtwTqgvMuyqLd7xhHaT9aK5B
	qy9Rru2U/tA0M41/w+KLJjSeq9aAqx0NiaAp/w==
X-Google-Smtp-Source: ABdhPJz86fFMCPW00iJSUcWFXuC8VVINozFIBvl4lE1/M4bNQl+wSixxq59myRCT/N2MsJDGjPNzdsgcL6TJY8X8OyE=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr23828394ejc.128.1633436533484;
 Tue, 05 Oct 2021 05:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
In-Reply-To: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Oct 2021 07:22:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
Message-ID: <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
Subject: Re: Acked-by missed when applying
To: Lee Jones <lee.jones@linaro.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2021 at 3:02 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Good morning Konstantin,
>
> Can you think of a reason why `b4` missed Greg's Ack here?

Because you applied the first v2 patch, not the second v2 threaded to
the 1st one that Greg acked.

>
> https://lore.kernel.org/all/YVLA14jbwqXjNM2f@kroah.com/
>
> ```
> + b4 am -3 -slt -P_ -o -
> '<1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab+huawei@=
kernel.org>'
> + git am
> Looking up https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb2=
28f7.1630586862.git.mchehab%2Bhuawei%40kernel.org
> Analyzing 2 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   =E2=9C=93 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
>     + Signed-off-by: Lee Jones <lee.jones@linaro.org>
>     + Link: https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb=
228f7.1630586862.git.mchehab+huawei@kernel.org
>   ---
>   =E2=9C=93 Signed: DKIM/kernel.org
> ---
> Total patches: 1 (cherrypicked:
> <1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab+huawei@k=
ernel.org>)
> Prepared a fake commit range for 3-way merge (a0fd2a641207..b603f718647d)
> ---
>  Link: https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb228f7=
.1630586862.git.mchehab+huawei@kernel.org
>  Base: applies clean to current tree
> ```
>
> Thanks.
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Senior Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
>
