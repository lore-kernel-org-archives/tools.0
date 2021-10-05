Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470429CA
	for <tools@linux.kernel.org>; Tue,  5 Oct 2021 12:45:39 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id 73so19591060qki.4
        for <tools@linux.kernel.org>; Tue, 05 Oct 2021 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yJTtJ+Taqmw11VDL8fk9gJfiQgOJsLBjrsF1Pb2/XHE=;
        b=WnoVO3hoTg8iBNtOh+mWX6wiLK6ZAqLpCsmuROwFPM4r8IEW4+nfih8mbWeULg7oqD
         mNzIj4O1sq425N11DL0sVspakxwSnGqV2+CCKz/PkatAx9jsQfJb8BaBks3FFawfWjSG
         kZ/rK69HVGYgtqKilMBCbziuxHTM7ymLzzaFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yJTtJ+Taqmw11VDL8fk9gJfiQgOJsLBjrsF1Pb2/XHE=;
        b=vgbI8IcP6DxDUOFLZGpHDw0tQp5+Kv222XqYmUZJxd7HIKqwsdXZ/n/NtbcM6bLRX0
         Wucmzalp7XGh04+4vUwaabFvfOzwBSeYCI8EyR7Pc/Tyla/yxpzq2lBaaZyHhBzQA7Gn
         ia+meKzuV9DWZliVXkqNQGi3NmYfv4Hot/6zVg5G3a3JHUiWo7Vfdhpkn/+rjC9ZGuUT
         ZdBISaVYJ/TcwQola7ZxLXJv/wp3CbZuul0v1N2jljUh2PZu4ZRPNLuSzN8pokR3b1uh
         BGhMtXU2HUdPrvqujxvdpjRRbZI4itFvHb1s5bXEEypBIY/Jbv5Zw/6A8HvgEs92B+M5
         JQ6g==
X-Gm-Message-State: AOAM532e5fp2RlFbVPCs+lR2NRV32qXcnCDyiOg7z+esHYvlfBhcaeJj
	ShSz4QC8rzHAHoFmmDrcnfBH6g==
X-Google-Smtp-Source: ABdhPJySWt/C2ULxRVQ5S7HgVjNH337EOgWQEPVyQnJSTIeJzhrQ9had5fSkud88DV8hWIKwwKckVQ==
X-Received: by 2002:a37:6851:: with SMTP id d78mr14456369qkc.220.1633437938641;
        Tue, 05 Oct 2021 05:45:38 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id a13sm512117qkc.78.2021.10.05.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 05:45:38 -0700 (PDT)
Date: Tue, 5 Oct 2021 08:45:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <20211005124536.ynz4ps5etrppfqxi@meerkat.local>
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
In-Reply-To: <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>

On Tue, Oct 05, 2021 at 07:22:00AM -0500, Rob Herring wrote:
> On Tue, Oct 5, 2021 at 3:02 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > Good morning Konstantin,
> >
> > Can you think of a reason why `b4` missed Greg's Ack here?
> 
> Because you applied the first v2 patch, not the second v2 threaded to
> the 1st one that Greg acked.

Should we issue a warning in such cases? E.g:

WARNING: Identically numbered patches found, will use the latest by date.
         Download and edit the mailbox manually for any other outcome.

-K
