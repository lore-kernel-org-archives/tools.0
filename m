Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A13CFBF9
	for <tools@linux.kernel.org>; Mon, 15 May 2023 21:50:02 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3f38c23b06eso52310801cf.3
        for <tools@linux.kernel.org>; Mon, 15 May 2023 14:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684187401; x=1686779401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4VvOnmJxSrtJ2zUmR9RBjIYfFHiCDTlnSMMLGOLggHo=;
        b=KYaqChnEmJ3SiBPjBikQfuG7MNWAQa5uR3BuoQeiBL5ry5xt4yxUvAENx3i5xpWd8l
         ruuPpC5wYnQnpIX3Q1S4tWdqKnp5yeAXuFuSDzTCVzud6ZqAbvLpy+/c4XaSB/KTAhyX
         KersqD9BNzuhAKqX0kv9NUDe+Uj8JJHDBE+Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684187401; x=1686779401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VvOnmJxSrtJ2zUmR9RBjIYfFHiCDTlnSMMLGOLggHo=;
        b=MX+VPAS2s4XHki4QEg7lnQNEAa1x8q3hg/lb6SchD62Pyc+lcLuQvgV2xwgDQXVYVC
         m2pN6L+NTpVB5WE60DwdRZtWZNfwxb2ZEmwWHDPOfWBLQqiDaDUshtg8MHXPw+jmHxtT
         Bt3SL7xMiqHIggx9dpgR0wGnJ7tJhny8s/UsZ5EMBDq8cPHhi4F7ProDYaTHORaGp54M
         F1VlYypH26euROxYqHN8kkBjUGHe0TH3INAOOMvmUUE5MhBDKC1Avgp3sd5mwzWHrMiX
         32k+X/Z9mvhfEncmO+cuG2LPUPhk1R+1lm1pi3XMpSjU9GSKiJ0ybTWqOImFUnI/Bupy
         pbZg==
X-Gm-Message-State: AC+VfDwIVkG1zOthSFx1ZVp1xGJ4G2oKnwQnJ9p+tk2QHE4IpUoxhp8t
	BLMr49+K0lBgyw7SlqsVxCdkQg==
X-Google-Smtp-Source: ACHHUZ6Knt+zlqEVLdSrQVENeux4SGyPUi6IKjwYUqXKM+aLHTCZo0cl3GmNsL8vsFsW3rTGj0PInA==
X-Received: by 2002:a05:622a:308:b0:3e2:4280:bc5b with SMTP id q8-20020a05622a030800b003e24280bc5bmr52817752qtw.21.1684187401251;
        Mon, 15 May 2023 14:50:01 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id bv24-20020a05622a0a1800b003f3c9754e1dsm5134923qtb.17.2023.05.15.14.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 14:50:00 -0700 (PDT)
Date: Mon, 15 May 2023 17:49:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: icon@mricon.com, ndesaulniers@google.com, mjg59@srcf.ucam.org, 
	tools@linux.kernel.org
Subject: Re: b4: executable sendemail.smtpserver and b4 --reflect
Message-ID: <20230515-version-unnatural-8d0592@meerkat>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
 <20230515-b217332c9-1b90c6e4656b@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230515-b217332c9-1b90c6e4656b@bugzilla.kernel.org>

On Mon, May 15, 2023 at 09:44:44PM +0000, Kernel.org Bugbot wrote:
> I spoke with the maintainer of our internal `sendgmr` tool; they recommended that the `-t` flag be used.
> 
> https://man7.org/linux/man-pages/man8/sendmail.8.html
> 
> Can `b4 send` add `-t`?

Sorry, I'm not sure why we'd want to do that. The purpose of "reflect" mode is
specifically NOT to send to to addresses in the message headers, only to the
addresses we pass on the command line. So, adding -t would be the opposite of
what we want to do.

-K
