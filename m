Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335BE2568
	for <tools@linux.kernel.org>; Tue, 26 Jul 2022 13:11:11 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id r1-20020a05600c35c100b003a326685e7cso812582wmq.1
        for <tools@linux.kernel.org>; Tue, 26 Jul 2022 06:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
        bh=c6n7W8RlwsEeza1NZslWzWRrSwxr435Oxj4x5AdbA/c=;
        b=t0Mc8z+ZtyrjhhMdYIn3rNlBnm2bSggFvcLYgGYIXjFak5N3VF4G9AnrKBYp99hc43
         NKH8cV/tXO5zo5h+pSkpCsIexZ6MpUBbgO2HfeX1aX4mF9xgcA24gyxWOYFQFw/3/b0/
         oQ7zkJtnYlyD2BtKLC+73ZpOU7az3EI1pcv7RXdsO9qd8w9Y0JjLg3vDstAXGVqsYiK/
         Bg7Nf9A1VrXUwTcpH5rYELWTPVTYZHIvSzQVwrnjfJ7aycmOys3373NkYXKW59GSK2yb
         BzvDNmbl5WZnDm9yW7gnEMgigYlnsVqHP3IaBbN+ff3B6U/JgQfw/YXRu0tCOfb8ppuT
         yG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=c6n7W8RlwsEeza1NZslWzWRrSwxr435Oxj4x5AdbA/c=;
        b=5RlYj9Buxe/BWu9HypkguEHcafFyfVhQkCgX834Uzo/BQHDIMrc7571rzmcs69el8m
         fs+sBkK+qBE8JLJBpON2qz/8oxwQ1a9sj9pzQbKmQfldpvKDKjFaFkd7Igah9dRFjlQP
         4c2UVjDSNolysdZ6omWiJGNN8mqBe7v2ERioLPZNvU2c/majR3tLVGS+fdFEAiTPXE7D
         P3cCq9jtZaasDbvYcQ2WpS/fprTpKkRNet8I8W9RCcKNb+yUseMohgmNB0Wj2N5DB/ej
         ZQzvVmeRSMsw7IcKKGQS1ke82/zfLwVXXZeOU5zNix3oeG89Jfo3ya/QbKTaHfDIKyX7
         aZxw==
X-Gm-Message-State: AJIora/J/FW4lICEXRMEA0Tt1xZPoeLVGe5L8KQZX5MlOVtzX8LPk64P
	u3Pyw1F+QQOx6BfV9pS52E7qig==
X-Google-Smtp-Source: AGRyM1uiqF7Jel6UK5b2951UrzW4NRaVy0cLyI9L/ZzkhFSmljx9egN1/fmmA0V5LC2UcsoGMtVxzw==
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id bg42-20020a05600c3caa00b003948fb80716mr24543642wmb.105.1658841069262;
        Tue, 26 Jul 2022 06:11:09 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c154800b00397402ae674sm24132164wmg.11.2022.07.26.06.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 06:11:08 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
In-Reply-To: <20220720184835.uhnkucai54alhgo6@nitro.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
Date: Tue, 26 Jul 2022 15:11:07 +0200
Message-ID: <87k08010k4.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Konstantin,

On Wed, Jul 20, 2022 at 14:48, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> Hello, all:
>
> Based on your feedback, I've refactored the submit functionality and it's
> ready for some more poking and testing. Here are the implemented changes:
>
> 1. Pluggable cover letter strategies
>    The goal is to support 3 different cover-letter strategies:
>
>    "commit": same as first implementation with the cover letter stored in an
>    empty commit at the beginning of the series.
>
>    "branch-description": stores the cover letter in the branch description
>    (which really just means the git config file). The cover letter can be
>    edited using the same b4 --cover-letter command, or just with "git branch
>    --edit-description".
>
>    "tag" (not yet implemented): will store the cover letter in tags a-la
>    git-publish.
>
>    The default cover strategy remains "commit", but you can switch using
>    b4.ez-cover-strategy, e.g. in your ~/.gitconfig:
>
>        [b4]
>          ez-cover-strategy = branch-description
>
>   Note, that switching from one to the other for existing tracked series is
>   not supported (and I'm not sure will be). It's also not currently possible
>   to enroll an existing branch into ez-series with the "commit" strategy
>   (because I haven't yet figured out how to insert a random commit into
>   history with git-filter-repo, but I'm sure it's possible).
>
> 2. "b4 submit" command got split into 3 different commands:
>
>   - "b4 ez-series" to create/enroll branches and manage cover letters
>
>   - "b4 ez-trailers" for retrieving trailer updates and updating your local
>     branch. Note, that with -F this can run on any branch, not necessarily the
>     branch managed by ez-series. E.g.:
>
>         git checkout arbitrary-branch
>         b4 ez-trailers -us -F [arbitrary-msgid]
>
>   - "b4 ez-send" for sending the series to the mailing list. It has all the
>     same flags as formerly for "b4 submit", e.g.:
>
>         b4 ez-send --no-auto-to-cc --dry-run
>
>     There is no more --reroll command, as using ez-send will automatically
>     increment the tracked revision number (unless RESEND was in the prefixes).
>
>     There's still no support on the web submission endpoint, but it's coming
>     in the near future.
>
> Thank you for everyone's feedback, and please continue testing it out. If you

I would like to file another bug around b4 ez-send --dry-run.
When using the --dry-run option, the To: section is not shown for all
patches. In fact, we only see the To: section on the cover letter email.

This is not reproduced when using b4 ez-send -o <folder>.

revision of b4:
  78725ba63b2f ("ez-send: initial support for tagging sent revisions")

git submodule status:
  0eb41be65707a1e156a59fd25ea9824c1a9e95ce patatt (v0.5.0-1-g0eb41be65707)

Steps to reproduce:

## prepare branch/work
$ b4 ez-series -n dry-run -f next-20220725
$ b4 ez-series --edit-cover # to remove EDITME and be able to use --dry-run/-o

## make an edit on a file which is maintained by Matthias Brugger
$ vim drivers/soc/mediatek/mt8167-mmsys.h # make some change
$ git add drivers/soc/mediatek/mt8167-mmsys.h && git commit -s -m "Example change for mt8167-mmsys.h"
$ ./scripts/get_maintainer.pl --m drivers/soc/mediatek/mt8167-mmsys.h
Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
[...]

## show dry run
$ b4 ez-send --dry-run --no-sign

## show output in .patch files
$ mkdir dry-run
$ b4 ez-send --no-sign -o dry-run
$ vim dry-run/0001-example-change-for-mt8167-mmsys-h.patch

Is this the expected behaviour?
To me, -o and --dry-run should produce as close as possible results.

Thanks,
Mattijs


> want to test the dev version of b4, use the same instructions:
>
>> ## Getting the b4 dev version
>> 
>> To install the b4 development version, you will need to run it from the git
>> checkout:
>> 
>>   git clone https://git.kernel.org/pub/scm/utils/b4/b4.git
>>   cd b4
>>   git submodule update --init
>>   alias b4="$PWD/b4.sh"
>> 
>> You can find out more details in the README file. You will also want to make
>> sure that git-filter-repo is installed (either from your distro packages or
>> from pip).
>> 
>> If you're already running b4 from the git checkout, make sure you run "git
>> submodule update" to pull in the latest unreleased patatt version.
>
> Best regards,
> Konstantin
