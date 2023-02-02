Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8610FD
	for <tools@linux.kernel.org>; Thu,  2 Feb 2023 10:18:43 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so987388wmq.0
        for <tools@linux.kernel.org>; Thu, 02 Feb 2023 02:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uYbL7tLvVARaZ7R8gQXXnbL85O98mMuYTvNYS735g0=;
        b=zIUhXmP4uMG89Xoj0SaAoxi4IWNAMaeBpMeG0P9w+LDE+Jq/uuVQqQlL0J0rEBONF3
         n2Bkx6eNuI0q5taRpWsMXu/6IzzpUBq+LEltQMmNmEsChUmV7LkmiccqnXZAsyTixk3N
         Fq7D+hx2NB2Hk/OLu8lErVIbmAKxUKZ773ud1wbcOnKBtwSQHdm/y3ctiyaj1A3iP6N1
         CSM6LzLMJXhlqPXOZBfqCCl5maqBK2wx1Y7xH/kG9ZEr2oiIaHuQje1oaY9pBZNXU4VT
         KEU0uLqlRpyQOap+XgMxYNSRjQSqxxyrMlwKELn/x8fSe8rsLewwq5NzkkWyUgcQqID5
         PjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uYbL7tLvVARaZ7R8gQXXnbL85O98mMuYTvNYS735g0=;
        b=M4qYjPuhkt3UkrnqHGGK9JeG9MbFF1YwMAtz8oR70FFgX+z7DZtnYw61HPcrJGxngQ
         1vKAOblwMjfmxHNZ72updpUhOcEbLfX9FqQC3cNYTXCL5obvFOgziIyvpe3Robb/Xmfc
         axfZoJTS09rDq8Xp9+Es+uBLjNgmzIw8ZNNDwLliyoSEblM0FXlSuXh6cl5u+jG44GS6
         D/XK0WqVv7WsoaTXyIwddh0l7qz1+AsuacR7sOXeeUo28vBD6GtCW08M6DFCBHWO4moi
         yPywseEnmxl/H5mFHFIm7JDP34jBD3xKmDR64+xJhVOrAcoeEx9eGi33gZAyjucAm0It
         n1+g==
X-Gm-Message-State: AO0yUKX6EJl5zS3NQpR2HUgl82XjFwCPAl/IfKjXL1bopxHAnnoburbX
	qkGyLZXqVPPO75K2OAUHfGJlv+hudgRRpnIGcBxg7A==
X-Google-Smtp-Source: AK7set/oJBJ98TrOaDHKpZzzvWsW0i+5nuC9icQFG0gJz8lJJrPUKotMFyhZH+Uj0upSL0kKRmpSvQ==
X-Received: by 2002:a05:600c:2143:b0:3df:85d2:c768 with SMTP id v3-20020a05600c214300b003df85d2c768mr2846228wml.26.1675333122082;
        Thu, 02 Feb 2023 02:18:42 -0800 (PST)
Received: from ?IPV6:2a02:578:8593:1200:8c67:99af:2126:3484? ([2a02:578:8593:1200:8c67:99af:2126:3484])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c35cc00b003d9fba3c7a4sm4797042wmq.16.2023.02.02.02.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:18:41 -0800 (PST)
Message-ID: <5479f931-a307-1f5e-ab3f-4594f47533fa@tessares.net>
Date: Thu, 2 Feb 2023 11:18:40 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: b4: idea: checkpatch.pl integration / hook support
Content-Language: en-GB
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tools <tools@linux.kernel.org>
References: <233f0440-7f20-6edf-256c-b8ebec53539e@tessares.net>
 <20230201214725.isvlkqy5sajpsgnk@nitro.local>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <20230201214725.isvlkqy5sajpsgnk@nitro.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

Thank you for your reply!

On 01/02/2023 22:47, Konstantin Ryabitsev wrote:
> On Tue, Jan 31, 2023 at 05:06:51PM +0100, Matthieu Baerts wrote:

(...)

>> For some like "b4 prep --auto-to-cc", that's probably OK to miss this
>> command because "b4 send" will mention that these patches will only be
>> sent to the author + other emails found in the patches. (It might be
>> interesting to have a more visible warning / confirmation if no
>> addresses are found in the cover-letter but that's not my main point here.)
> 
> Yes, I've tried to think of several ways to avoid this, but each has its own
> level of annoyance. One thing I will definitely make it in:
> 
> - if there is a b4.send-series-to/cc defined, we will insert these addresses
>   into the cover letter at the moment of creating/enrolling a new branch (`b4
>   prep -n`).

That would be clearer indeed. I guess if this is in place, the "send"
step will no longer look at b4.send-series-to/cc options so we would
only control the emails addresses from the cover-letter?

> This will help a little bit, but not with the kernel, where it really is
> important to run the underlying command. I'll think about your suggestion to
> give a warning for when there are no To/Cc addresses in the cover letter.

In MPTCP dev subtree -- containing commits that will not end up in Linus
tree: CI, etc. -- I added a ".b4-config" file with "b4.send-series-to"
(and a prefix): for us, we prefer if the patches are only sent to our
mailing list before reaching netdev and the net maintainers. Once
accepted and applied in our tree, we will send them to netdev with a
wider audience.

What I mean is that in this case, there is already something for the
"To" field, then no need to run "b4 prep --auto-to-cc" or give a
warning. But when we want to send these patches to netdev, we need not
to forget about running "b4 prep --auto-to-cc".

>> But for 'checkpatch.pl' or other scripts specific to some subsystems,
>> there will be no reminders from "b4 send" to check that.
> 
> I'm trying very hard not to make this a "tool to send kernel patches." :)

I understand and it is a good thing!

Maybe 'checkpatch.pl' could be seen as something similar to
'get_maintainer.pl'? If the script exists, b4 will try to use it by
default? :)

> However, yes, we should offer a way to do pre-flight checks on the series,
> probably via `b4 prep --check`.
> 
> E.g. it would make sense to make this definable in a per-repo .b4-config file,
> like so:
> 
>     [b4]
>       series-check-cmd = scripts/checkpatch.pl -g
> 
> The command should accept a git range as the last argument, similar to what
> you're doing below.

That would work for me! I can add this entry (with other args) in the
.b4-config file in the Git tree.


Regarding the fact we can forget this step, do you think 'b4 prep
--check' could eventually mark if it has been ran in the
b4-submit-tracking JSON in the cover-letter? Then 'b4 send' could warn
the user if the check has not been done.

Ideally, it could be nice to make sure the last version has been
checked. The SHA of the last commit could be added somewhere to make
sure the last version has been tested. If the cover-letter is in a
dedicated commit before the patches, I guess we cannot write info in the
JSON there because the SHA of the following commits will be modified
after the rebase. Maybe info could be written in the Git config or
similar? Or just keep a timestamps but that's not very accurate?

>> For occasional contributors, it could be nice if it is automatically
>> executed before sending a patch. But I understand there might be other
>> issues to deal with: missing dependences, false positives, different
>> rules per subsystem, etc. A mention in the doc and/or before sending the
>> patches might be enough.
> 
> Yes, I'm reluctant to make this run automatically during the "send" stage,
> but for sure we can do a --check command.

It makes sense to do that in "b4 prep".

> We can also integrate the same command into "b4 shazam" so maintainers can run
> checks on the series they are reviewing.

That's a good idea!

I'm currently doing that, automated by scripts running "b4 shazam", then
"checkpatch" and other small checks before including patches in our
TopGit tree.

https://github.com/multipath-tcp/mptcp_net-next/blob/scripts/utils/add_patch.sh

>>  ./scripts/checkpatch.pl --strict --codespell \
>>     --git $(b4 prep --show-info | awk '/^start-commit: / { print $2 }')..
> 
> Let me make the following two things that will make this less awkward:
> 
> - I'll add "series-range:" to show-info
> - I'll make it so it's possible to get a single value out of --show-info, so
>   you could just run $(b4 prep --show-info series-range)

Yes, that would be better indeed :-)

Thanks!
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
