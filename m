Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D929CA
	for <tools@linux.kernel.org>; Tue,  5 Oct 2021 12:48:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id j10-20020a1c230a000000b0030d523b6693so2950128wmj.2
        for <tools@linux.kernel.org>; Tue, 05 Oct 2021 05:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=X6xRMFK/uDv0jrsUMgjMV9KfeKXcCqpVpt2Ik4U46Qg=;
        b=EKA9xTSzSueuM02Ij5R0OjO8cOK2Us1zEMBqs1PSxOaRKq3/14YivvLQC1Rz1Fgq+n
         /P8EKpRVaCmp+N4PhaujFG00QUYRf9Aav1YiINXzYT0RZwPahKgWfENApf8d/5jqkBM4
         alFBGSZ380M8eKzLMIGkKuJ6Src16pnyJngVQLxfOauXCvykxCi+OdLRsbVTpAoD83GH
         KTBNWyYCbrFzNIsPu3eNems+wqn4O9fSfkNKbxK/UqZ3H1Y28xJ0RX0EP87yQYj6moW0
         QyYK80MJerADqxlLEaH+qRuCMzBTOI2UshO5ruAyBe/SdBcZgK4OKKJCRs09mK+dRDA7
         aPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=X6xRMFK/uDv0jrsUMgjMV9KfeKXcCqpVpt2Ik4U46Qg=;
        b=L3qKam36SfjiBMGKsJYJc+C5HHn/2hrK4f55hrttKxrMsl9/M+t+19TJ/MnUDrQSGM
         P+zogwHKu97gjIQaol3kMxm8y356MjHautd/+98qAa26CGbklYi86wCbMQHeiSzscctD
         7XsZsV/qxIgNhPzIouo9SVSOqrvjTzl9jo9N6un4llYHkZ47BKGV1UhgfoUmVKMtjCkO
         4XsZ/oc4O+QEwt3LkHGCZV4L+uJJlcWUEpcLKdZTLsMV78lpaWnPaz6+S7Q/t64TuwH9
         Uo0DGA6YpMYGz7aC/cFlobXjgEV92IJFP0qJRyX7l4aROvjOAV6LfJ1R8Gae6gu1K5rP
         qtWw==
X-Gm-Message-State: AOAM532kreqnH3hcFA2cu2+Yc9RaNQI9nZpji/45k0wshOoonhOO7MKk
	Qbm8PC/nDY+7laO0u+h9rUetUA==
X-Google-Smtp-Source: ABdhPJyy0qOffusCW3WcVSvK03os9mfoZVt5xldknOhUJSXfMwKhcpeeWpgJlDgfvv6nvOsU5gxrwA==
X-Received: by 2002:a1c:29c7:: with SMTP id p190mr3203723wmp.65.1633438086797;
        Tue, 05 Oct 2021 05:48:06 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id d16sm1756146wmb.2.2021.10.05.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 05:48:06 -0700 (PDT)
Date: Tue, 5 Oct 2021 13:48:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <YVxJhOU239wRw+no@google.com>
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
 <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>

On Tue, 05 Oct 2021, Rob Herring wrote:

> On Tue, Oct 5, 2021 at 3:02 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > Good morning Konstantin,
> >
> > Can you think of a reason why `b4` missed Greg's Ack here?
> 
> Because you applied the first v2 patch, not the second v2 threaded to
> the 1st one that Greg acked.

Not sure I understand.

This is the thread of the patch I merged:

https://i.imgur.com/k4hD9kO.png

Greg's Ack is located in the 5th message down.

> > https://lore.kernel.org/all/YVLA14jbwqXjNM2f@kroah.com/
> >
> > ```
> > + b4 am -3 -slt -P_ -o -
> > '<1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab+huawei@kernel.org>'
> > + git am
> > Looking up https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab%2Bhuawei%40kernel.org
> > Analyzing 2 messages in the thread
> > Checking attestation on all messages, may take a moment...
> > ---
> >   ✓ [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
> >     + Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >     + Link: https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab+huawei@kernel.org
> >   ---
> >   ✓ Signed: DKIM/kernel.org
> > ---
> > Total patches: 1 (cherrypicked:
> > <1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab+huawei@kernel.org>)
> > Prepared a fake commit range for 3-way merge (a0fd2a641207..b603f718647d)
> > ---
> >  Link: https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab+huawei@kernel.org
> >  Base: applies clean to current tree
> > ```
> >
> > Thanks.
> >
> >

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
