Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.41523.1585240351787712748
 for <tools@linux.kernel.org>;
 Thu, 26 Mar 2020 09:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KduL0LTi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.68, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-lf1-f68.google.com with SMTP id j11so5401902lfg.4
        for <tools@linux.kernel.org>; Thu, 26 Mar 2020 09:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7s8+jAY6lFGRthBwAkibbinvk7rFbgPA4uiRAnwbScA=;
        b=KduL0LTiSpWkHcbNVKT1ncEmVbDutq6UggG2m3FiGSJL5ufxt4XEFSPmOW3Zg5hM1s
         z0Xkjda8KVEjyfA+WNP5Ms9ngqLeaiSGaOJA3AuHArAHMX3+ncQlPr2CCHaaqJAHAogv
         vJyXk6acryv5Gi+o+0mWzcCRcGIGJKyMLrlnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7s8+jAY6lFGRthBwAkibbinvk7rFbgPA4uiRAnwbScA=;
        b=L4E6Z9hSInA6X+nGEZi+jeDF72bNC/rSr0EIxJbJhbdVm12PvyQSS0xl5eaUv3Q6T5
         /GCrB/z46OtHayB+KGPT1w3xLltOl2t/N2+CjL7foqOfIe7I9PC69MQXnRTIoau5Ixn3
         nvNFAqGVXqjvamPF4R8wtwid5Fx97iXZIwQqJ0WpnTFySKc5dlWXsq0E2aNMq8BUaQfJ
         TlxwzRARK4AAbIvUOLrKNLK+fqE9FO2resuk0mSIHYH52gxVjwMC+73T6tuO+2MkdlMz
         gmLOrELHAqKhY90rToun4feD+PV7PBa3pxupd00fMHmyyJQa9VVkYgVwDSWr7XaKk7ap
         GoFA==
X-Gm-Message-State: ANhLgQ30TJCMViyI5QXnP0VAu7E06zDXTGBwprr8dyDFkTu47tBEuQTl
	r8i/2m+bs8fNbNT/BsAmqp90xA==
X-Google-Smtp-Source: ADFU+vsy/y9bJxPlip0jToNGT9IrOFtLZPzWI1JARr0qAMKo4GeE8vzLkHpBs7Jbk3qqN+iv9/vWMA==
X-Received: by 2002:a05:6512:552:: with SMTP id h18mr6333500lfl.48.1585240349676;
        Thu, 26 Mar 2020 09:32:29 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit3-readme.dfri.se. [171.25.193.235])
        by smtp.gmail.com with ESMTPSA id r141sm1838613lff.58.2020.03.26.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 09:32:28 -0700 (PDT)
Date: Thu, 26 Mar 2020 12:32:25 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>, users@linux.kernel.org
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.3.4 released
Message-ID: <20200326163225.qkitq6dkmqj2fw5l@chatter.i7.local>
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
 <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
 <15FFE6D3B979AF4C.32445@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <15FFE6D3B979AF4C.32445@linux.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 12:16:22PM -0400, Konstantin Ryabitsev via Linux.Kernel.Org wrote:
> > > I'm seeing corruption of the subject on patches[1] with a comma in 
> > > the
> > > subject (and I'd guess only ones longer than 70 something chars). It's
> > > fine on lore web interface, but it gets wrapped in the downloaded
> > > mbox. A log is attached. When it gets applied, a space is inserted
> > > after the comma:
> > >
> > > dt-bindings: iio/accel: Drop duplicate adi, adxl345/6 from trivial-devices.yaml
> > 
> > Nevermind. It's not b4, but the dri-devel list that is corrupting the subject.
> > 
> > https://lore.kernel.org/dri-devel/20200325220542.19189-2-robh@kernel.org/
> > https://lore.kernel.org/linux-devicetree/20200325220542.19189-2-robh@kernel.org/
> 
> I think it's actually Python's fault. I'm trying to isolate the 
> operation that causes it. It makes sense that dri-devel also exhibits 
> it, because it's a mailman-managed list.

No, your initial assessment is correct -- this is done by the dri-devel 
list. I was confused by the caching layer that needs to be fixed to make 
sure that we can grab the same thread from multiple projects (I'll fix 
it today).

$ b4 am https://lore.kernel.org/linux-devicetree/20200325220542.19189-2-robh@kernel.org -C
...
  [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi,adxl345/6 from trivial-devices.yaml
...

vs.

$ b4 am https://lore.kernel.org/dri-devel/20200325220542.19189-2-robh@kernel.org -C
...
  [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi, adxl345/6 from trivial-devices.yaml
...

-K
