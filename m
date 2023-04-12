Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8139472
	for <tools@linux.kernel.org>; Wed, 12 Apr 2023 19:39:41 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id ly9so11674827qvb.5
        for <tools@linux.kernel.org>; Wed, 12 Apr 2023 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681328380; x=1683920380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DEIjlU8hodtdY2jGdrUkf+0r6EpA9NP3YhcTiLKXyRs=;
        b=WFtDG+kZ5QfREQpJWIe9miNNsRjo/7Peq3SN+1eet+WMHsjGqqADavWs+H6mOTLEw3
         kFm/novlfSC/CcJHIZfPdugoojDbDour9aYysdEHY0s9/ZruItd4Y+hS0/e1a1Bz7r0U
         mEGzdPQlArziF+5Ack56K4IhjvUPkqdnGOaZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681328380; x=1683920380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEIjlU8hodtdY2jGdrUkf+0r6EpA9NP3YhcTiLKXyRs=;
        b=DHSckaD057JDb+5B/xrM5Z6G3ievFar+yIMwcxkZmtuPWJgQCXN7a2yb7RvL3q428N
         EWdcYXNqIWvSHYzzFTsD5KQB4Y1qAiyLFcHL2typn2D0AasrBXDPMNL75KWCtSzXCKO5
         50gsMr62f2fpNBopPwP11fwP3OA7nuJHR0G6TpRXoI6u7wlr77OUmVreNFwBFsJsRo7R
         7yWsU8P38CyhH1iSF00qBwN6n0HbzvBXUf1B3z8QXWtp7GVHka30lBL+7WjG0uXziGzo
         vUgVFQN19YScgfKdx1M6ksHq8QHopb+F/M5gu/mL2P14k97Zmf+jVHCwEdG7NlN3smV8
         YGwA==
X-Gm-Message-State: AAQBX9fk6RNeJOGiuf6I2IWvdxjP41/g7SXAoWxrFt/OUnPqfvoiOV07
	Hoynn+NhrwyNFcZzjKpOOnOH2Ixzc5skeU8Pi5I=
X-Google-Smtp-Source: AKy350aKO95EQxlDk+8qIEErIR90ACkA9FF+dUHygr44KHGMipE2CBTQ2fFalb5adP5fAYCov65edw==
X-Received: by 2002:ad4:5941:0:b0:5c5:6e60:eacd with SMTP id eo1-20020ad45941000000b005c56e60eacdmr9829085qvb.28.1681328380170;
        Wed, 12 Apr 2023 12:39:40 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id u8-20020a37ab08000000b0074abbf22b68sm937867qke.136.2023.04.12.12.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 12:39:39 -0700 (PDT)
Date: Wed, 12 Apr 2023 15:39:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: icon@mricon.com, tools@linux.kernel.org, mjg59@srcf.ucam.org
Subject: Re: executable sendemail.smtpserver and b4 --reflect
Message-ID: <20230412-awkward-bobble-2a9614@meerkat>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>

On Wed, Apr 12, 2023 at 12:00:09PM -0700, Nick Desaulniers wrote:
> ...
> [user]
>         name = Nick Desaulniers
>         email = ndesaulniers@google.com
> [sendemail]
>         from = Nick Desaulniers <ndesaulniers@google.com>
>         smtpserver = /usr/bin/sendgmr

Oh, you actually provided what I was asking. I'll check why we're not putting
the full name into the From: header.

-K
