Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE3418FC89
	for <tools@linux.kernel.org>; Thu,  2 Jan 2025 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843233; cv=none; b=mXRorjXCy3HO+afg5YQ/LxK2tAHPwIh2aJF9whA+n8OhpSpsOwMkmI7h0ngCR0fbSS/qKboEbzsbwdfvR6jF35k+tFCXn4uCaxHPzAQgQVkdcUlTip+uSw2WEtyigCFM1nQGsGBjL82a6joLdgNfGBdftWbT9Isq9O6S5fes8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843233; c=relaxed/simple;
	bh=qgVWT/eGHmGH9t6KTXsnu0rwibsoFQFMMa6ZCVU5LOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8/WQebSv1cziDIrQxqRlPNbLgH0hwi4On9Xkbd5L2Q+79nj8cVZXiNnPp3qFAqB9mB/A9dUwxy/oKlOIUJfN2RgsilSmn7LnINDfeL2+r7ODc7Qr8jWCySgfOmDQnBvRVOhyxRp9jIlrYQ0aFPMAH6fDQVQn3X9iZEQD400vDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5W1voEt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5W1voEt"
Received: by smtp.kernel.org (Postfix)
	id DB350C4CEDC; Thu,  2 Jan 2025 18:40:32 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE8C2C4CED0
	for <tools@kernel.org>; Thu,  2 Jan 2025 18:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE8C2C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so141091651fa.1
        for <tools@kernel.org>; Thu, 02 Jan 2025 10:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735843229; x=1736448029; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgVWT/eGHmGH9t6KTXsnu0rwibsoFQFMMa6ZCVU5LOk=;
        b=H5W1voEtFi9diSLkP++l5iI9YPo7z+th7o9PliZpjW1qM2YFnbLmunU0ELLtHWjJAq
         oArLLl571DZKR092EfADaCCgqgXrXxLY2TPACee/8Vo8WLhhTCHPCEGh+quTjcinmf5o
         tXDPNvEtsru2hMpW8rYTEzu7Ok3NikKqr9U5DDuS9eZ2pRuQ3N7uNKr5YvawT4pPIYxi
         gi9lb9UeeOlFFGqedKgvJK8IpZBhwPLpOe22Bofz9OBb9MrrRtAYULPk+enFf6M7p7Na
         YPAN7At8jqWv/gQBaRtPH04CtYo3EU4/zY67v5yOH6g5Rvwa3OSYRmv6vVz3ktIL3qRL
         a66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843229; x=1736448029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgVWT/eGHmGH9t6KTXsnu0rwibsoFQFMMa6ZCVU5LOk=;
        b=Vp6ns5LdUYOoEwJTAF8LB9meLasFqQd0eUO1CWf6IVcaL6UwwsDq1lH3hjuJh6N8QU
         bqbaqHbqaVexR6XSPq1E/gp6G8+Fou7fJvxQXsPWnc9bIkIJKEuVPJhNAbZH6cTWBfdF
         M7OsuW6ijDae/sXWpyU1p1Lr75D4rVTH8rgz8c7mFtkEVV+sx46gNXZaSNzjHE833bkd
         i38lNBtJEBGPFIc/142XokiVYn2caBPdVATkDQP/Avr11T+O8emxPbS5On5HOlfpoA0C
         nkicD6UAbM+u124bHp0Gjw8AY9IP868qh8ikrz4VjmCCrFQsesfYiYSDyAp8q4oLaJDd
         v9Pw==
X-Gm-Message-State: AOJu0YxfZxxhPlWcnYcI7zVy3dlIcIwYJFFDWKwmLiBO3XxCDRto3hjD
	gWRY2OjXRru1r8eHQ0M3UVj0NT0b4s1ieB05eHDhXBYg9cL/3B8o7AhLV3BAQVlPW+qrvrvkql0
	OHZZlXTefjYsdupgdFcm+Rb9n2GIqyw==
X-Gm-Gg: ASbGncuKtNCpPgrgi+p5AgmuOnF+uf8/fhS0Gac0WohsbHapPtNgE6ka36N/NBLzMg8
	Gl35OzmKLnae2deKhjDOKbL3ymX5J8DLO6gNL8T0UV+Y/mWgbQMfTzNTZqL5rjyGjLCRwp8k=
X-Google-Smtp-Source: AGHT+IGCZe3cKt27q/bk82Ns/cfjCuwOGNGICtlp67I4UCbIFlRsmalBqQhzF7nF42isS/wui8jwRv4h+3Jaf0B/Suk=
X-Received: by 2002:a2e:b8c3:0:b0:2ff:cb47:3c77 with SMTP id
 38308e7fff4ca-30468605037mr188709271fa.26.1735843229015; Thu, 02 Jan 2025
 10:40:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
 <CAJ-ks9=jGp8d4q0wqRqZ8Lut3o-QypwR8EP3bfBmXXTNjQVvaA@mail.gmail.com> <5u53v53wb7u2cmhg5muq4nemzpwh3wvd7kz4fi6uamutl5s3oa@gqrfslzn2eio>
In-Reply-To: <5u53v53wb7u2cmhg5muq4nemzpwh3wvd7kz4fi6uamutl5s3oa@gqrfslzn2eio>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 2 Jan 2025 13:39:53 -0500
X-Gm-Features: AbW1kvaXAW1Nn3QjzHFRnTZPMUcR1gs-n2kTQsHHCSA9bYur3sPvNqVjpx1d84I
Message-ID: <CAJ-ks9=0qhtdWdpGOWBvGxEX1zbZ-1Y+Zfa7N+9DYHoZBQspFA@mail.gmail.com>
Subject: Re: [b4 PATCH RESEND 0/5] Resolve some static typing errors
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 1:44=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> I hope to be able to get back to doing b4 work this week or next! Sorry a=
bout
> the delay -- the holidays and other priorities were keeping me occupied
> elsewhere.
>
> -K

Hi Konstantin, hope you had a good holiday break and happy new year.
Gentle ping to have a look at this, if you could.

Cheers.
Tamir
