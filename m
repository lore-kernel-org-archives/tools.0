Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D4F2F24
	for <tools@linux.kernel.org>; Wed,  9 Feb 2022 10:54:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MIyiY-1nb3sn0MKQ-00KPEl for <tools@linux.kernel.org>; Wed, 09 Feb 2022
 11:54:11 +0100
Received: by mail-wr1-f49.google.com with SMTP id s10so3315378wra.5
        for <tools@linux.kernel.org>; Wed, 09 Feb 2022 02:54:11 -0800 (PST)
X-Gm-Message-State: AOAM531UCuaXrHHv1zZSb41wT/YyahbF7B6ng8MjCyUSlzKcwAE1xKnk
	cCnkQO8x2+FQ8e4DaGwUxd1yc9Hh7qMhUKa6o4Q=
X-Google-Smtp-Source: ABdhPJxugtg6gSJ5yKtECTW6ZzPpqsMeQKamkfAgqDbe6JEyrID/CxRqxsvKJbDK1yRDIHsQzipWwELtWYNOFGJ69uY=
X-Received: by 2002:a05:6000:3c6:: with SMTP id b6mr1584515wrg.12.1644404050733;
 Wed, 09 Feb 2022 02:54:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <e6ddc3ca-74bc-14a0-6ebf-8cd331706899@xilinx.com>
In-Reply-To: <e6ddc3ca-74bc-14a0-6ebf-8cd331706899@xilinx.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 9 Feb 2022 11:53:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a12bBvs3mJ-8P0uf8fd+cOxw9ywAzUb64+hMRotsCHWPA@mail.gmail.com>
Message-ID: <CAK8P3a12bBvs3mJ-8P0uf8fd+cOxw9ywAzUb64+hMRotsCHWPA@mail.gmail.com>
Subject: Re: b4 can't pick up patches in another patch series
To: Michal Simek <michal.simek@xilinx.com>
Cc: tools@linux.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ti3ufKSe7DSRP0X6VS2Dfx5IOWu4txs07QwLOscbNSsmDoGoxzz
 tTpg+iReIVrR4ezhAVBct8fjAppJANdddoKC3t1Orjcg0ak7tT09qCfk8u/UyVU0ORev1LY
 Jqn+sCNBCtKvThQ54fdzCMjT5/LAkbqSsj+v2HfLKPTGcabi1gM6sMrRr06BzNIBwDBbMGR
 HKwrZOdw/ZtuXcJoxtcwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hv4EYh9C90g=:KjAnAbruvEqEXAnGl92mq+
 xtDkb92MXdhjcbhmKzTnhTu63sCytcxmZYRKxPAxDHAasqddahkh2bcXgVNYQbn4FFmjVpZH9
 bv4yo5je3ioWZ8sm/XIagx1/mndcgxb93DLYyDrjsG1OCEvxjVNFCflwc41qDjrRe1VGuGUwu
 4MeZI+3ZxgMBxCNo4Aw8V5QTzM+sz5aWhDOggrSImQldQZntuHtCg77poa5dBzchaHNZ9EnUJ
 EIq7tmWoou3f2crBDU+KHE5gqZndlh/yp28ABGqvncTMev36J4trL4K1cB7EV2d5OYijXB+0Q
 IexViqJa4Zj5QOUcnnEvQXciwfz8AFqdmhSiJKqda2GAIUoNyPVz5BxTgKZyBhPHnui9uzXt/
 BJvDxl3ajA1P58cGPZ8rmpCZJlvDF3tBb2KbmesrM+3HssswjtARJJJ2stl7NNWcZOnPq9iHp
 YzJAmAlKYogwHeI4R4pPV6rOabhBsJOPQN59g3wRDMO7VfUOBotoMTe6oHVcRK1kL7Fk8Xs9z
 fGKRaoNqyZsYGr8jfLgjwDvJtTkSQ4y2h/W1baaEP/1nBWs+zSqqcLH1jEhMdjIW+eoUusFSm
 WGGlk/RevTwGQnmhsDBLvwfRbZGcYHcTCF070DPcRh91tPsc4/qStc0+0uZw4EQRFCCrgATYX
 /ItsEfeVIct5yMfyECmBqQlZqqmmyH/kYV9qepwIwLiHhhR6XEMSCJCh7IifZzvMXfRY=

On Wed, Feb 9, 2022 at 11:32 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> Hi Konstantin,
>
> I am using b4 for quite some time without any issue. But I have just found one
> issue in behavior.
>
> I want to pick up this patch
> https://lore.kernel.org/lkml/20220117132757.1881981-1-arnd@kernel.org/
>
> but because it is the part of another series the whole series is pickup and this
> patch is ignored. It is understandable how origin series is found but I think in
> this particular case Arnd's patch should be taken instead because it is clean patch.
>
> Log is below also with my b4 version.

I've had similar problems as well, but usually just work around
doing a manual

wget -O patch https://lore.kernel.org/lkml/20220117132757.1881981-1-arnd@kernel.org/raw

Having an option to ignore the threading and just get a single
patch would be helpful  as well, as I sometimes want to
apply patches from a single series into more than one branch,
and I can still use '-l' or '-s' that way.

         Arnd
