Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.40833.1585239117633928384
 for <tools@linux.kernel.org>;
 Thu, 26 Mar 2020 09:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=X1FyEAKF;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 049FD2076A;
	Thu, 26 Mar 2020 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585239117;
	bh=PuipyVBUvFH8x06tWWvMAUWokNY5rZy4C78YolcwGSc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X1FyEAKFWElPZJN+gNxcny0hHFezrX8oUoglHFAQJJNKFdDPCAKr2725rmyM/h5ko
	 hrX/oltks1Pn9C18fVNE7cvdXnStKCwkf97PxItbDbaN/gIc/fAxmR6afafHciYUKg
	 Xh0lyIfn0vQWMTtEAK42vRSaZMGt8QRLtZx3pePY=
Received: by mail-qk1-f178.google.com with SMTP id v7so7201704qkc.0;
        Thu, 26 Mar 2020 09:11:56 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2Qrk3omGzaks637NiLXMjrXRYlXOBb3j4uIBSSB79FsCIB+kdO
	AsLnZ/s+iTf7yfp1xMaTrQ2OR0DNKzDFPjUCkQ==
X-Google-Smtp-Source: ADFU+vtB5/icQNaK6t3r+EBgBojrpIVdki44p9rr6W4oqdXn1T587YUeeHgbs0vjxHVWRIik9VFLEzrQrO4VXgfFoLc=
X-Received: by 2002:a37:4a85:: with SMTP id x127mr8995604qka.152.1585239116127;
 Thu, 26 Mar 2020 09:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local> <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
In-Reply-To: <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
From: "Rob Herring" <robh@kernel.org>
Date: Thu, 26 Mar 2020 10:11:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
Message-ID: <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.3.4 released
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 10:04 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 23, 2020 at 4:20 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Hello:
> >
> > I pushed v0.3.4 to pypi, so if you're using it from there, you can run
> > "pip install --user --upgrade b4" to grab the latest version.
> >
> > Notable changes compared to 0.3.3:
> >
> > - deals properly with series versions that are only mentioned in the
> >   cover letter
> > - adds a b4.sh wrapper that lets you run b4 without needing to install
> >   with pip
> > - fixes a couple of backtraces due to bugs with patch attestation
> > - adds a caching layer to avoid hitting lore.kernel.org on repeating
> >   runs (e.g. when rerunning with -t, -s, -l, and similar)
> > - properly refuses to install on python version < 3.5
> > - uses more descriptive filenames for "b4 am" mboxes
>
> I'm seeing corruption of the subject on patches[1] with a comma in the
> subject (and I'd guess only ones longer than 70 something chars). It's
> fine on lore web interface, but it gets wrapped in the downloaded
> mbox. A log is attached. When it gets applied, a space is inserted
> after the comma:
>
> dt-bindings: iio/accel: Drop duplicate adi, adxl345/6 from trivial-devices.yaml

Nevermind. It's not b4, but the dri-devel list that is corrupting the subject.

https://lore.kernel.org/dri-devel/20200325220542.19189-2-robh@kernel.org/
https://lore.kernel.org/linux-devicetree/20200325220542.19189-2-robh@kernel.org/

Rob

> Interestingly, DT patchwork suffers from the same issue.
>
> Also, I got tripped up with missing acks again because dri-devel got
> picked and it moderates non-subscribers. A way to set the default
> project would be nice. Perhaps rather than a single default, making it
> a list of lists to try. Or trying lkml first might work better if
> we're just guessing.
>
> Rob
>
> [1] https://lore.kernel.org/linux-devicetree/20200325220542.19189-2-robh@kernel.org/
