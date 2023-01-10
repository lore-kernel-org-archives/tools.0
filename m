Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED5423A6
	for <tools@linux.kernel.org>; Tue, 10 Jan 2023 22:45:00 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id h21so12203849qta.12
        for <tools@linux.kernel.org>; Tue, 10 Jan 2023 14:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IEYClhcj6NinoNIfjUe0l8McNSbD1ZdaX/0nH1NwjVo=;
        b=MFyEbhiOs1F5BEaGkzjk86Rmb0zLGzloIv2AFN/EBgHu/zby5k5OPjgTABuHMWptlg
         /Nwce+BHd4/1gIRwDZbnWnlF3uQLl+MOc+5JaVNdSvXVcc/iB4OXG9cZEOdjN/mepN5i
         rt4OZwUXSbfE85AzjIe/6Fj6QoAyeLPzAgTVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEYClhcj6NinoNIfjUe0l8McNSbD1ZdaX/0nH1NwjVo=;
        b=HalA58IycS1eLknrj76rG0ZOiiJ99aKbjUSxetY+6c5+l4S6pUr0BzMGIydtryRZWe
         l8eBvYo/FrSBYHUYUjMJ4/oHLdWSgqM8zQr94Zynra/nO/S2B1xaPHK0Esahz53mOIi/
         ldQEEvLwLPbT5A5LM1yRfx01wQwYYouWpDfn5zH8I59ioF7sIHh9L8LbDlCfxywH4GVW
         V2Ph2AJVAf81vLhFavd9DOKMiBYvhzrr1f0vZjqVUnoH8/CZFWb+qYmgNXAtnFWxiS4F
         0fowFxRIyv4DplZK68q/+vRdESvDXsH+PQ6jO3t1Mc74abNXl1wcj1y5gTnH3LYcObUH
         /eVQ==
X-Gm-Message-State: AFqh2kq9WVIqyCO3l4QyT9tDAXt4v27R6DlTQ2F0EFKDiDBxVPNKhLyq
	iHSS4CS6Y8ha6NtNt+siVwQyAQ==
X-Google-Smtp-Source: AMrXdXvUazi51pWX0p8mq16RM5ztdxm32CMmyzTIF0Br2qbOzS+QGyNoaDL0CXOz6W62jisMDNRZAg==
X-Received: by 2002:a05:622a:250c:b0:3ab:6e0c:166b with SMTP id cm12-20020a05622a250c00b003ab6e0c166bmr6615630qtb.47.1673390699821;
        Tue, 10 Jan 2023 14:44:59 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id z13-20020ac875cd000000b003aef9d97465sm1842652qtq.43.2023.01.10.14.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 14:44:59 -0800 (PST)
Date: Tue, 10 Jan 2023 17:44:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.11.2 available
Message-ID: <20230110224458.fe7a6prxj4lzs3gr@meerkat.local>
References: <20230105164003.kv35ovoeshcvgnia@meerkat.local>
 <CAL_JsqJpp5uOUkKYtC9QRmDQMBNpW=U8=7UhmD6gtJ-tk+MrjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJpp5uOUkKYtC9QRmDQMBNpW=U8=7UhmD6gtJ-tk+MrjQ@mail.gmail.com>

On Tue, Jan 10, 2023 at 04:22:40PM -0600, Rob Herring wrote:
> On Thu, Jan 5, 2023 at 10:40 AM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Hello:
> >
> > B4 v0.11.2 is available in the usual places. This is a small bump release with
> > a number of hotfixes. Everyone using v0.10 or v0.11 should upgrade to the
> > latest version.
> 
> Repeating this here for a wider audience. 'b4 send' (reroll really)
> will remove uncommitted changes in your repository. A bit more detail
> here[1].

Fixed in master and stable-0.11.y.

Thank you for the report.

-K
