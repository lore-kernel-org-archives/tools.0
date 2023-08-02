Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2C101D0;
	Wed,  2 Aug 2023 18:46:21 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so223832e87.2;
        Wed, 02 Aug 2023 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691001980; x=1691606780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtU6VuXsx7roT13UG8tPt/mQEdG/y3vK1Kwbqy2ewE4=;
        b=nDHQOhiAZ+9p5yrIUCLf+fMtC5uv5qnhzZNT0rO+maK2OkJepVODNbAbTGDP2BfjSH
         X6qSTMw5syIjFJLMTjH133utdoZArDxX1PBBQvFmPB3gsrkvsdlD4lq6rGP5fxm9twBF
         3AkfK4kXiu56gdNd46A4wYH6bogYz7fwx90RQhuyJIpLgn9X/o4AK6cG0N0CvsRUyXYg
         5UbI/WdtWNceVd2RGzHne8JNFccZM896W8D77ARSmBYFGU9Qo5faDBaa1YhTTBijQ07F
         BuD44WvRRCewiEvGvO20Sb8TUNStvyXR+6IQrwWDcxn+Ryc2OQHQZwdIRIu1wx9fobKs
         u+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691001980; x=1691606780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtU6VuXsx7roT13UG8tPt/mQEdG/y3vK1Kwbqy2ewE4=;
        b=BRN5NYkZF/VsXG4svAOxftdypXjv889jSQN6UuZ1LMaTrCrAzSyQTVqEQLQBG2Ut3a
         AYbBe32NbgDSAFEk7ElRYBAiGn5h1o+P/1EjwfLhfPNlOwBc5wXrSOigZTm8uBlWB6AS
         Ax0dze8v7sp8ieIHbzrdRIDygx8PgrWt/mJ5lLi18JL7VkF2UkS/JUbcBBqTTCFn8krk
         10Fwm6kEnCQmUz6iRjX0McWtT4Bu7NipVjtM+VhlE9jJNfpdUzwy63bOJ6TmwXKP55Np
         XiVrCPl+HTaYPfT6HOpCLOJx0+SQ9nOG+Yg1jFoe0t/yx/RkwWkxXs7V2n8NAwTlbDJ0
         Qfiw==
X-Gm-Message-State: ABy/qLbW+s+u3cWYZSsqBFPSfnPyEEDshDEqhw7FvlAHQfGeD+eoG8Y5
	IQHJigGq5p0Wy0H7wN+moydyRn1ApUfMIag5sLY=
X-Google-Smtp-Source: APBJJlE4rILQDp2wdcmQ19FPRgafQDgUVApYgCK0EXZFdJ9DAw6JZXGwSCS0VATOSIFmyiFnDs8Z4MtFtXC/dI4WTzA=
X-Received: by 2002:a19:771d:0:b0:4fe:61f:3025 with SMTP id
 s29-20020a19771d000000b004fe061f3025mr4734959lfc.61.1691001979391; Wed, 02
 Aug 2023 11:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAFMMQGt=-0HRpmb+fD0e_LVeZ_TPr-8QEPnorAkffrVOowb4dQ@mail.gmail.com>
 <20230802-failing-cheer-6f381c@meerkat> <CAFMMQGs6Mt-19JJCOtSPDicONDBOEf5jw2yrixv6PZruPRUiPA@mail.gmail.com>
 <20230802-snowsuit-quizzical-95f660@meerkat>
In-Reply-To: <20230802-snowsuit-quizzical-95f660@meerkat>
From: Chuck Lever <chucklever@gmail.com>
Date: Wed, 2 Aug 2023 14:46:08 -0400
Message-ID: <CAFMMQGuqgFCPY6xpAiG67vox3sEFooFSbgx8WOhSpbbTUmuaZw@mail.gmail.com>
Subject: Re: Most of my "b4 am" runs fail the DKIM test
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 11:54=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Aug 02, 2023 at 10:57:35AM -0400, Chuck Lever wrote:
> > curl -s https://lore.kernel.org/linux-nfs/5b0eff4e3ef9bf9621f5095189933=
f60def40f0d.1690569488.git.lorenzo@kernel.org/raw
> > | dkimverify
> > signature verification failed
> >
> > A DNS issue makes some sense; I've made some DNS/firewall changes here =
recently.
>
> The following should succeed for you for DKIM to work:
>
>     dig -t txt k20201202._domainkey.kernel.org

My DNS server is on a different system than the firewall. The firewall
assumed that by default, the DNS service will be provided on the
firewall/gateway system.

I added a firewall rule to pass DNS requests from any host on my LAN.
That enabled the "dig" and the "dkimverify" commands to succeed.


--=20
"We cannot take our next breath without the exhale."
 -- Ellen Scott Grable
