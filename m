Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66563C8FE
	for <tools@linux.kernel.org>; Fri,  2 Jun 2023 08:28:47 +0000 (UTC)
Received: from [192.168.2.32] ([87.132.200.153]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDy54-1pxGu00pkq-009zzv; Fri, 02 Jun 2023 10:28:29 +0200
Message-ID: <d08b8597-35df-0c27-dfad-289cb28276a1@mweigand.net>
Date: Fri, 2 Jun 2023 10:28:21 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: b4: workflow for selecting to/cc targets of individual patches
To: Nathan Chancellor <nathan@kernel.org>
Cc: tools@linux.kernel.org
References: <bdefe087-28a2-d541-933c-ccd743cc8b62@mweigand.net>
 <20230531204103.GA1864972@dev-arch.thelio-3990X>
Content-Language: en-US
From: Maximilian Weigand <mweigand@mweigand.net>
In-Reply-To: <20230531204103.GA1864972@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3ex8x4e1936gA4KzaOlZYMEFvAZyTKqCm9MpAeAI7kvg3GAexYX
 3IQDsvCIy/cx7ctyzjTxl8x5X4bc1Q+AvU6hS02rBcXBzGKFPmiou8mLW2hJfsBf2MNp0Hv
 ZBAKPl7MUl6AlBPiV6m+O6ABmPCgYiKpMh1Tkd9Gd4zuFcNb9J5H0dx6uVluX2PQF5PSZeg
 CFZt/ZHPeKSzucN8yHp4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4Y5XSoafh0o=;0zn7503m6R7GCEYBCVHadiLuGgh
 0wubKaSdU+Ho7c5zMRDbmzHvnIqgI/APzBMNoOQ8xiHnJ1Wk8oNGqhN0dOVnuS91LmdEnZil7
 FalLKjb9dkzGXi3zFa5O7wPgUKW4ge4Dnbc32hacDYX+nmCu9HKE6Cc1ex8qOyEtpNBK16+rW
 9bshz6NhaHA75etBZCO8uRMEzXJCr0JNUntYjmlrOaluQBiqA+6fViKRVkjsKW08PVdsK/FSO
 1u0hKhcdby96PTgESpk9PC3X6turRp/fZTmumwOb7i1zuoc9Qp75d53bffSUBv3tU6FGy07z4
 eNqrnviHPS8U/rheozsIwxqIXFB5ieVVZsbdwzqc887oXs1LoBNZFWkuq6jwpYzjPishucSRz
 ZcLp7Ym5He73lYhPyq9uTzcLutXCwj8wwLOMgpfJVht7oDJ2gibij4QT4UUDYH4fQHfUsSn9O
 zDc3vzydIwDp5IS5B8C1uEHasnsIxTHzmkPvOKYTImk1sOKTid2TwkuFAEHLfc1FSKU5QLFLB
 WWB4ilw+NciZUdV7u9adaBhnXNadoQ2y8PNetsHeSWY7tfqHnSv5vDdFME7W8Ixh1WEJDpShe
 E2aO30CpC1eDWRiMHV8YI0xxl1yjQFDpK/WA1ZnDwanc1mTyq64982RRcqWQoSYxVeQrEBuiB
 0cBCX0OPH1qlokiVbsnIQGb1YsuXRplGdx65+U27kw==

Hi Nathan,
> I am not sure if this is the "recommended" way but what I have done in
> the past is included the To and Cc trailers in the commit message of the
> change in git with a '---' between my signoff and those trailers,
> something like:
> 
>     <commit_title>
> 
>     <commit_message>
> 
>     <trailers>
>     Signed-off-by: name <email>
>     ---
>     To: name <email>
>     Cc: name <email>
> 
> You can see what it will look like if you flip through the patches here:
> 
> https://lore.kernel.org/20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org/
> 
> I recommend adding them to the scissor area (i.e., include them after an
> explicit '---' in the commit message versus adding them to the
> <trailers> area) so that when the patch is actually applied, they do not
> get included in git history, as they can result in extra spam if any
> patches end up in a stable release.
> 
> It might make sense to have some way for b4 to do this like with
> '--auto-to-cc' but I would generally say it is rare to need to send a
> series with a conglomeration of patches with a single cover letter to
> multiple maintainers, unless you are doing a massive treewide change, in
> which case, it is often better to break down the series per subsystem,
> which can help with tracking and sending new revisions. That might just
> be my opinion though :)

Thanks for those clarifications. I see now that most small submissions
(such as mine) probably do not require separate To/CC recipients and
that correspondingly it does not make much sense to implement something
like that in b4.

Cheers

Maximilian
