Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442001F16A
	for <tools@linux.kernel.org>; Thu, 22 Jun 2023 17:22:53 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-62ffb475be0so57409236d6.2
        for <tools@linux.kernel.org>; Thu, 22 Jun 2023 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687454573; x=1690046573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QtvCdhTKpEQg15N5awOFIFLx23IdStR6qWBWHUWVRWY=;
        b=KU7APKkFENwJqtJqdXKZ+zFb8eZMU4h1SCzb7wFCalkxcRuZO9+l4AYbE/LTmI+nMk
         C2Pn8ej2L0/obzDpzCyZ+RQVsMpV9hZRUBsdDu7Jcugw8Lzw9zNau0bEFZYcwtviyrgE
         EOCgfUKM01uFRGSOBv8iGmNiTlEyH7mJjErVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687454573; x=1690046573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtvCdhTKpEQg15N5awOFIFLx23IdStR6qWBWHUWVRWY=;
        b=FbNSFConnmL99wapAAfWkrAemtOr97iCxdWrFApczqPHrNW5C3eQ6vyAnBlvP2FAhm
         uLb3BSXOU0KaKN8IpxzGwAKo8bbB7y+O8hpDm0ufHBJF+FY6hBhdExTDCTwqxu8CerTL
         xhcMEGTHv+gqPSJl8fsBO1VyFef3Em5b5dmao90D+AbFMssrh6QsIZXTrMMQIEaGlNaW
         /ll9S9AC4v3hGlAosZlR3eAI6VT/QjprM6C56I+NRR/O10mjLIooIESMhGhsL+pfGkW6
         jJUk2OEMqtBvxaK84wH7RVntRZ/a/ZRExLcW4lFbC6IXtHCUGJ5tRgVtixVkwTrM57Jh
         IaMw==
X-Gm-Message-State: AC+VfDzNBV2BIgep80CHmYk85jFmXNKVdsf1q4Yx1KfATm1b2QUx9g0i
	Ph4o5Ly05Tp8l+f/Nk+3KqbClQ==
X-Google-Smtp-Source: ACHHUZ7rJb5KRtss0LzDe6wQIpxhBAWmwV2Zh/QdxoCMxLlrGlSiYht+LoOwZ/sJDEupbbuOYWEIRQ==
X-Received: by 2002:a05:6214:d08:b0:632:30e:314 with SMTP id 8-20020a0562140d0800b00632030e0314mr2109462qvh.44.1687454572930;
        Thu, 22 Jun 2023 10:22:52 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id kr30-20020a0562142b9e00b006300e1db3ecsm2304988qvb.141.2023.06.22.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:22:51 -0700 (PDT)
Date: Thu, 22 Jun 2023 13:22:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: [BUG b4] encoding issues with single-patch series
Message-ID: <20230622-unafraid-dazzler-a413d5@meerkat>
References: <CTDYR84I395O.2UI69IKNO7B8A@fedora>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CTDYR84I395O.2UI69IKNO7B8A@fedora>

On Fri, Jun 16, 2023 at 11:22:51AM +0200, Erik Schilling wrote:
> Earlier, I sent a patch where I tried to CC Alex Bennée. The generated
> mail included the header:
> 
>     Content-Transfer-Encoding: 7bit
> 
> the CC header got correctly escaped, but the mail body contained the CC
> with UTF-8 encoding:
> 
>     Cc: Alex Bennée <alex.bennee@linaro.org>

I was able to replicate this, thanks.

bugbot assign to me

-K
