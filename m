Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B36CB422;
	Tue, 10 Jan 2023 22:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7591C433EF;
	Tue, 10 Jan 2023 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673389372;
	bh=lsWqW/NcQ03cymfKIe0YaRPRCmlikdUo4XEIS7QEKqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=czRUB/63mGM03u56ZLuVC3d5Gl8UQOoRm/NkeQMjqeKlSHYLNuKCVFHWGCX+x8gBp
	 CPW3GXEgbGl2ytNQ4C9miVsHUUOB3bTyGmcsJWrqy/zOG+VbH7yeu/J+IMn6z9oD1Z
	 AAKxxSteRsxcWl26lYaIFhrzgJLUa1b8KpCO84Dzu70wpRFN71/RK8yWKrGTilgRo1
	 HEuKgLEFF4TAWhwAGik0MpSt7A+uIUDZ4TIKmIR7pGrqvHKTJQsb2wpzSRXnk1lkVn
	 WYX+xApRTP6i5Tp52mFZEMj/kuWg2IViIUpym82YUoX3wpYwy6JAmj2Vvt4wYkWXOV
	 n2TFXajPxfsCw==
Received: by mail-vs1-f52.google.com with SMTP id v127so9461341vsb.12;
        Tue, 10 Jan 2023 14:22:52 -0800 (PST)
X-Gm-Message-State: AFqh2kqGFoviFIUSzTWnRHsaNg5fx1/1g7Mk2GWFuATRZbQa4JATFBMn
	Q49xsKWMPyY8WqUh3a2dPgda46NaUnM8g5pDoQ==
X-Google-Smtp-Source: AMrXdXtXGR9cSVhT62YxgrVc6rIjJ6Nx2OA1ArzbLYfENgil+tSN7c3bWifL96xK2Jm75P6Uolepyu+b+VVT4qBXLZk=
X-Received: by 2002:a67:edd4:0:b0:3b5:1fe4:f1c2 with SMTP id
 e20-20020a67edd4000000b003b51fe4f1c2mr9512189vsp.0.1673389371716; Tue, 10 Jan
 2023 14:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230105164003.kv35ovoeshcvgnia@meerkat.local>
In-Reply-To: <20230105164003.kv35ovoeshcvgnia@meerkat.local>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jan 2023 16:22:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJpp5uOUkKYtC9QRmDQMBNpW=U8=7UhmD6gtJ-tk+MrjQ@mail.gmail.com>
Message-ID: <CAL_JsqJpp5uOUkKYtC9QRmDQMBNpW=U8=7UhmD6gtJ-tk+MrjQ@mail.gmail.com>
Subject: Re: b4 v0.11.2 available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 10:40 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello:
>
> B4 v0.11.2 is available in the usual places. This is a small bump release with
> a number of hotfixes. Everyone using v0.10 or v0.11 should upgrade to the
> latest version.

Repeating this here for a wider audience. 'b4 send' (reroll really)
will remove uncommitted changes in your repository. A bit more detail
here[1].

Rob

[1] https://lore.kernel.org/all/CAL_JsqLU8qb-aNGDZ45mq8_e=Oin6QY+8vBdfyUSPBFDVCFJEA@mail.gmail.com/
