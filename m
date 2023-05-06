Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3826CD2FF
	for <tools@linux.kernel.org>; Sat,  6 May 2023 20:24:00 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3ef3ce7085bso14689031cf.2
        for <tools@linux.kernel.org>; Sat, 06 May 2023 13:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683404639; x=1685996639;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OehmRPtxDMV9ep/1DAuvhEFlYE8iy/En7+MJZ1VlFsQ=;
        b=dWcQWk3cQ4A7aDKqvxmBEtrx6sKTTQfs/pAZVezXiONmFVtTTFYfY5anHjLqD9cTUZ
         5pynS4oZSF+Wt6M5PrFfkF7EjOnPjQiMDc+94h0ABJQy72WNzNeehzIAMFKKDOx9CWln
         JadPa6nDqO5wuTPnvqsCSKsL1nnkpJHbTgpIBdakROEeFrb1e/LY1iGDevvUW0ymVv+U
         LWTQTnWxe554IeZJGlIkjN6QJohc+koDHjlLzdwQmH1p/3HxXhrOOSlS4TEnBmxJBMo9
         3DAOdXKE0oU8wUJwW6dJ7jwEBupiKiCdCvBGeagNEtra8hy8358bpMffWlWXZNrxpRZI
         55ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683404639; x=1685996639;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OehmRPtxDMV9ep/1DAuvhEFlYE8iy/En7+MJZ1VlFsQ=;
        b=jVu7z8aYXyCyaRTittpcRFR0TMx6LNQ/lgfB0dQeOA54wXsjJQWq61DOXOK8s9afh/
         fIEfMC8+m73MOpAHF3zWm9jJHPGAPKnIzOy6wgHUSeHYgBFeeSes8BSENYQlI7K3jeFl
         v0A0xqLuptKc56E+RmnwReTEnXWtJAHkY3UVim2aLzZg8wBclSRNbDbqMOIFd5OGwmla
         1Ylx7CRL1A+mtyJwymQpiJj2G/WXxpbZmGCbzH9wFiGtVaIuL2DlWWZKJqzycMHJNfRg
         QulcK/srMcYGuyzo7/Uw0HO/jqNcYjDi5JLe49i2t1ue3SX0DEoKlEonDid6eLJ3aRwg
         RujQ==
X-Gm-Message-State: AC+VfDwdTJOiz07v8ie5ZoXhSn/q8+S82yz4ykaoKMNI3coK/ZNODaLk
	DiJstxQnoBVvTmEH1FIGofBbOh4UA10=
X-Google-Smtp-Source: ACHHUZ7Qm/Yc9Bjjyrcy6Y/xO5a84KHmSW2Q+AF4NOF6FNN1AVTIjt2+uNp0tMC3EUPgpV9Tt32ldA==
X-Received: by 2002:ac8:5d94:0:b0:3e9:aa91:3627 with SMTP id d20-20020ac85d94000000b003e9aa913627mr9451811qtx.65.1683404639072;
        Sat, 06 May 2023 13:23:59 -0700 (PDT)
Received: from [192.168.1.127] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id b7-20020ac801c7000000b003f364778b2bsm1704452qtg.4.2023.05.06.13.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 13:23:58 -0700 (PDT)
Subject: Re: [PATCH b4 0/2] am, shazam: allow cherry-picking an out-of-series
 patch
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <8d917d5a-0a68-2610-65d7-d90695005c16@gmail.com>
Date: Sat, 6 May 2023 16:23:57 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit

Hi Konstantin, 

Le 2023-04-15 à 15:30, Philippe Blain a écrit :
> This series makes am and shazam able to cherry-pick a patch sent by a reviewer
> as a suggestion (second patch). The first patch is a preparatory
> simplification.
> 
> If you want to test it, you can do so in a clone of git.git:
> 
>     git clone https://github.com/gitgitgadget/git -b pr-1515/phil-blain/doc-auto-merge-v1
>     git checkout 66c7e51415
>     b4 am -o- -P_ https://lore.kernel.org/git/ZDnCMegeiw0kT5oj@nand.local/
> 
> Cheers,
> 
> Philippe.

Friendly ping ?

Cheers,
Philippe.
