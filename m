Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D7259E;
	Thu,  1 Apr 2021 22:16:17 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id g38so3293281ybi.12;
        Thu, 01 Apr 2021 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=mvm+Fbn1YXNwLCzVbIc5UwURS3nB5TcmggwkZGNSNXY=;
        b=PQTfyo5+/5vCq1p3cXXyat+jp9NRdbLbrRSosOV8Mreme6xyeL2AoihOinvyd9k9LA
         griT1hkNnjuGI5nulNPINm8kWagiMdPpfXjsd28u9uKxQycmAeiS2TmvBdfHh1tvhXzu
         bw84UP5BoOYp7Y85cBYU4TW7llsJdgF6ygf9hLaoZSulOobYEIvVyZjSsERlQVVf4pCe
         Fy6lxGrF/xLes46V5MOJaYRXsm/vovKqfymP9vM0Hls5URWvML3aQsVhV+Ixbx3F7lsd
         hVARZTrZy5L93/paelUXW55dy+EYFFIuOecrnInqbMznqTFHQ6GS3SsmYThOcjPaStbd
         tCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=mvm+Fbn1YXNwLCzVbIc5UwURS3nB5TcmggwkZGNSNXY=;
        b=EynPlhgeiIcCith+jvVxizhh1MygAR86faFnTYGpeLUL14yZoLpPoa13g62kgVfN7k
         s24e806b0SkZq+PccgWbrOKPWWhbP9Je2v3bjBg9o21kQchLQml8RmcmX+czBQvR/ThN
         pOd8lxs4ukiMAejlTmyU5apn4IthZJDsW/T2l7nU6jlMQj/ncZte1GC3oGUz8qL/jUX7
         IoZ1OluxeOWwGN10eJX9hz8m1gX/R49xaEXQudSFBUyIANM2ngozXlUO1d7jLf3NREPD
         oWsW3t2o4x75n+4CriRFKEIx0OXFNplFxFphKbObyEppcz1h3UwxLrTzn45dIFlKqQmi
         wM6Q==
X-Gm-Message-State: AOAM532nsswmomTmmN/u9iPuO36QK8NLpTr9QLqzCieOiBKzTzg05tpR
	/y4Gtv1aoZWKJ66hzO0cpE69lbPxBTaR2njkqESqEDrRI1Ue9g==
X-Google-Smtp-Source: ABdhPJyMtkV1FWshjLC2Ga47wSCTVq5facLNdFntbxL7sA9ks8Jv2gDajjz/15J1WSWyyvQwVeIMyJ7LTV6aStjh8t8=
X-Received: by 2002:a25:b781:: with SMTP id n1mr9538943ybh.115.1617315376939;
 Thu, 01 Apr 2021 15:16:16 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210401192706.dlsv574jmhvszuq5@chatter.i7.local>
In-Reply-To: <20210401192706.dlsv574jmhvszuq5@chatter.i7.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Apr 2021 00:16:05 +0200
Message-ID: <CANiq72maNPt60YvRGfjnETn0Q6s_ZXZdyzB_=sxQ0Tz5bmrWWA@mail.gmail.com>
Subject: Re: [sig-prover] random tarball signature verification script
To: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 9:27 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> I resurrected one of my previously unreleased helper scripts that I used to
> run to randomly check signatures on various kernel tarballs. It will do the
> following:

Thanks for this! Curious: is it random because it helps avoiding
others to predict when the checks would be done if run at fixed
frequency & pattern?

Cheers,
Miguel
