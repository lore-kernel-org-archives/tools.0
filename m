Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812970
	for <tools@linux.kernel.org>; Thu, 20 May 2021 22:06:08 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id k127so17854559qkc.6
        for <tools@linux.kernel.org>; Thu, 20 May 2021 15:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=o7FCosv48tLWaHa6IwI7IIQtSMHEhSzlioiMPiE8Rko=;
        b=Nsl7451KmsJlzkMGY8ydmEoWCdeZRGeyxVnVwMxZLmj3VlX1wiJhdjCUOORYER5wP3
         l2dbVg/JIXg9mv/S0lWwiFcYFTDCnVW1CWyqfyCCk5w1u2Yb1CBggiQ5GJU4ErFRFQw5
         RGNPWoJLC7sVuCJkIkVxNzIMWwx38QuOwJlyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o7FCosv48tLWaHa6IwI7IIQtSMHEhSzlioiMPiE8Rko=;
        b=prDMat7zBynQhQKSyeT72eXSeVKx+JVYIjOkiIVTpswYcIsRoGRcmk+lEPWO5soJmp
         3nrv20CjYe3PvFRZDCx4o9W57C3lVSt6nEfZr+nmMvBFdWTr9efq5oRkuY0/TDqzqq7y
         SJ/y9wbngnFRM4c5n59N7zO1N0S/pbjhwbmEFZMj4QGw3gjOVAu5sxcM0Nmurrw7mHxk
         qZ2n61NsqpnO61JQpSTE+f51VHdpeFZ1sFxfpSM0Imc30ngxKyghRa3FX96yrZeZEPRc
         vSUJZdEpL2t6r56Cbw9yDodVTDkN6/7ArPI6FLLWQytw4mdP1IytPzEhPfg4H9EajVeh
         AhMA==
X-Gm-Message-State: AOAM531x9/gj6zhRDdH+xz0njrNdnnhT4019eiqkZiQpD5Nh7+FTIB4F
	oBWnfAXwJWBbHBf+yIRIJLtCng==
X-Google-Smtp-Source: ABdhPJwqj/c9M/KtL0ZQCQj+SIPWV2zTy8KMBDULNcogwGQIqHczBYPR/UfK3b/BtE6KA63fZZw2jQ==
X-Received: by 2002:a05:620a:751:: with SMTP id i17mr7827888qki.87.1621548367565;
        Thu, 20 May 2021 15:06:07 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id t128sm3079290qkh.50.2021.05.20.15.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:06:07 -0700 (PDT)
Date: Thu, 20 May 2021 18:06:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "users@linux.kernel.org" <users@linux.kernel.org>,
	tools@linux.kernel.org
Subject: Re: b4 not finding explicitly specified patch
Message-ID: <20210520220605.6cnct2wdmjxlz52c@nitro.local>
References: <CAMuHMdV7gLtcuW6sCJh3HyWpgwr1rcCEEaDkN2L+chZgVMQTpw@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV7gLtcuW6sCJh3HyWpgwr1rcCEEaDkN2L+chZgVMQTpw@mail.gmail.com>

On Thu, Jan 21, 2021 at 11:05:51AM +0100, Geert Uytterhoeven wrote:
> Hi Konstantin,
> 
> $ b4 am 20210121082248.883253-1-saravanak@google.com -P_
> Looking up https://lore.kernel.org/r/20210121082248.883253-1-saravanak%40google.com
> Grabbing thread from lore.kernel.org/lkml
> Analyzing 63 messages in the thread
> ---
> Specified msgid is not present in the series, cannot cherrypick
> $
> 
> Without "-P_", it downloads a series not containing the patch I want.

Well, only 5 months later, but I do have a fix for this in the current
0.7-dev:

    $ b4 am -o/tmp 20210121082248.883253-1-saravanak@google.com -P_
    Looking up https://lore.kernel.org/r/20210121082248.883253-1-saravanak%40google.com
    Analyzing 5 messages in the thread
    Checking attestation on all messages, may take a moment...
    ---
      ✓ [PATCH v1] driver: core: Make fw_devlink=on more forgiving
      ---
      ✓ Signed: DKIM/google.com
    ---
    Total patches: 1 (cherrypicked: <20210121082248.883253-1-saravanak@google.com>)
    ---
     Link: https://lore.kernel.org/r/20210121082248.883253-1-saravanak@google.com
     Base: not found
           git am /tmp/20210121_saravanak_driver_core_make_fw_devlink_on_more_forgiving.mbx

Best regards,
-K
