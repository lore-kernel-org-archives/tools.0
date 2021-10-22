Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF402CA0
	for <tools@linux.kernel.org>; Fri, 22 Oct 2021 08:05:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQNAv-1mI1PY2muH-00MM7N for <tools@linux.kernel.org>; Fri, 22 Oct 2021
 10:05:41 +0200
Received: by mail-wr1-f51.google.com with SMTP id k7so209591wrd.13
        for <tools@linux.kernel.org>; Fri, 22 Oct 2021 01:05:41 -0700 (PDT)
X-Gm-Message-State: AOAM533k2QyhwoU5iEWnvXcZUE1yKsf/WHVxB/MpBqI1vBX7Yf5n+Goe
	tmOo0DBgcofurRZIBdZ1vskpk7t5jOcdCaUxRXc=
X-Google-Smtp-Source: ABdhPJyu+pEwu+Upc4J1F1wYc6XRnKT6RwC5jUYgC2xTFM57L/QmtCrsxX6cfjJ4f9joItjuSW2EO3DyfaUaECNN+2M=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr13815132wrc.71.1634889941126;
 Fri, 22 Oct 2021 01:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <202110211313.B5C5C61@keescook> <20211021204459.xd63t5xn24vktqf3@meerkat.local>
 <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org> <202110212044.D38D0993E8@keescook>
In-Reply-To: <202110212044.D38D0993E8@keescook>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Oct 2021 10:05:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1UrWfPxQP5v757XdOyEz-GE-jkStpQisA2mhAVneKwtw@mail.gmail.com>
Message-ID: <CAK8P3a1UrWfPxQP5v757XdOyEz-GE-jkStpQisA2mhAVneKwtw@mail.gmail.com>
Subject: Re: injected body trailers
To: Kees Cook <keescook@chromium.org>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h5xnaV8Yuss6Pdk3owPn6arOXSkfOwOhjJx39sGrUYGph2lIqsB
 4l7yZe7HYXRTuaSYJzzguI5nJ+1pDsibjX+WhyG7NSlKwdKCnuQNiSjw2UKm3AHtEqBi8Wu
 5JqyCbOl2xeZqkWX5EdytbVcJwJ9KYr71JGc1S6JlWFOxDijzo6GQIJzjpIXhxIJbLwBDcZ
 Zm6qmjTAZFJB4KfgR1Ogg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DJuuzvpv1vA=:bsGGOxhKpO0BDRG19RqkG1
 +WGl2+T2OQG65x1Rw1VYbY/omGdSt9GVNbp2E4x8xWDj57bO3URz4jeeTVNmds0z8mivR0B27
 kAYQUUaxvIomCkGcwz3YUf0CkA9VLRCwKkBhiJpvd3TpgAD93ZuqIiRYHVNHw5ZFc+UUxXl5y
 iss8/vxQiCl7t+DDczBHQfPJ+gCjX6BYxuTwPxokmy7VKlY6b9iJn18o+sAgL7wHm460hb6So
 YvUcyoVHUYPpquWqxZkWeqGw2kxaWuP2dIxTVkNzL3SqWOhttgzyRwzZGutlUPb3GEFDxqOwS
 EkMGiacO8mOpUf/qF5SYeYaE+qUWCqtwJNpW/gb4Qwij+XEPA7+aPV08SWWlCMU6+2F1cGk5B
 T8Wa120dEBKKDRYwQEpD2CLheQHhELS8PioxHaR/F7P3k0Lng5lu7WYQa3z57lLHmBVGgrywh
 XnC5lc8ajce9t37/I/nCTfhiBljCPQTZ57PwXhaaQDMOWxvcDupunS3nJeg4M93xjwwKBz/pV
 gNnlejV7degvC0KyWlx7NGOkCwV3MhZ1kPACTfeStS8F83QiBODAQAXzsui3yx+9rk0I8gRWV
 uJYEKhIFWHo61byJbtbA2HNJ3LJfqsXnhCOnyxWvryL09mLjhORTdAHBHJxu9+t56kTzlXxZ3
 eVHeB3ejCXoohV81eBNcwFn1h0qp+knGB/trkixU+F+GEh+xzm2RI4umoO5rrVFsDFyY8f5GQ
 JijuG0BJPaOl2x2mNYU+i+LG/uoTCUs0xiegIhwpBQnfxAY0OPlJa5CvsXQp3DKuipLp9ewGG
 Hs5ekdBFegYVAvxRtSTme0NkiYCigoajR6TQZX6FSy5RbOPCzw=

On Fri, Oct 22, 2021 at 5:53 AM Kees Cook <keescook@chromium.org> wrote:
> On Thu, Oct 21, 2021 at 10:42:46PM +0100, David Woodhouse wrote:
>
> How about we reset that password and make the following folks the
> list admins, assuming they're interested:
>
> ARM64 PORT (AARCH64 ARCHITECTURE)
> M:      Catalin Marinas <catalin.marinas@arm.com>
> M:      Will Deacon <will@kernel.org>
>
> ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
> M:      Arnd Bergmann <arnd@arndb.de>
> M:      Olof Johansson <olof@lixom.net>

Fine with me, as long as I'm not the only one.

       Arnd
