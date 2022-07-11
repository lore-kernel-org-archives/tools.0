Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826232F29
	for <tools@linux.kernel.org>; Mon, 11 Jul 2022 22:43:08 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:55648)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1oB1eC-009pJi-Vp; Mon, 11 Jul 2022 16:12:57 -0600
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:47124 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1oB1eC-00C71j-1j; Mon, 11 Jul 2022 16:12:56 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org
References: <87a69fct75.fsf@email.froward.int.ebiederm.org>
	<CAHk-=wge5Dh6ukEQoueSh9dzn6GPqGiRtDQqfSnP5vWEXKJzXw@mail.gmail.com>
Date: Mon, 11 Jul 2022 17:12:50 -0500
In-Reply-To: <CAHk-=wge5Dh6ukEQoueSh9dzn6GPqGiRtDQqfSnP5vWEXKJzXw@mail.gmail.com>
	(Linus Torvalds's message of "Mon, 11 Jul 2022 15:02:06 -0700")
Message-ID: <87y1wz8fj1.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1oB1eC-00C71j-1j;;;mid=<87y1wz8fj1.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.174.4;;;frm=ebiederm@xmission.com;;;spf=softfail
X-XM-AID: U2FsdGVkX1+Mg+ojls4Xs7EhAmmgqKaQ2yeORcmvbZU=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa08.xmission.com
X-Spam-Level: *****
X-Spam-Status: No, score=5.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_SCC_BODY_TEXT_LINE,T_TM2_M_HEADER_IN_MSG,
	XMSubLong,XMSubMetaSxObfu_03,XMSubMetaSx_00,XM_SPF_SoftFail
	autolearn=disabled version=3.4.2
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4092]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa08 1397; Body=1 Fuz1=1 Fuz2=1]
	*  1.2 XMSubMetaSxObfu_03 Obfuscated Sexy Noun-People
	*  2.5 XM_SPF_SoftFail SPF-SoftFail
	*  1.0 XMSubMetaSx_00 1+ Sexy Words
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-DCC: XMission; sa08 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *****;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 428 ms - load_scoreonly_sql: 0.04 (0.0%),
	signal_user_changed: 13 (3.0%), b_tie_ro: 11 (2.5%), parse: 0.80
	(0.2%), extract_message_metadata: 13 (3.1%), get_uri_detail_list: 1.21
	(0.3%), tests_pri_-1000: 15 (3.4%), tests_pri_-950: 1.45 (0.3%),
	tests_pri_-900: 1.12 (0.3%), tests_pri_-90: 138 (32.2%), check_bayes:
	135 (31.6%), b_tokenize: 5.0 (1.2%), b_tok_get_all: 41 (9.7%),
	b_comp_prob: 2.1 (0.5%), b_tok_touch_all: 82 (19.2%), b_finish: 1.41
	(0.3%), tests_pri_0: 232 (54.2%), check_dkim_signature: 0.52 (0.1%),
	check_dkim_adsp: 2.8 (0.7%), poll_dns_idle: 0.64 (0.2%), tests_pri_10:
	2.0 (0.5%), tests_pri_500: 9 (2.1%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [GIT PULL] ipc: Fix free mq_sysctls when ipc namespace creation
 fails
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Mon, Jul 11, 2022 at 1:04 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>>
>> Please pull the free-mq_sysctls-for-v5.19 tag from the git tree:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git free-mq_sysctls-for-v5.19
>
> The pr-tracker-bot doesn't seem to understand octopus merges, so this
> one didn't get a pr-tracker-bot response despite being merged.
>
> I don't do octopus merges very often, but since I had done the ptrace
> fix as a hotfix for rc6 and your other pull request thus didn't bring
> in any new code (just a new commit), I did your two pull requests as
> one single merge:
>
>   23458ac91dc8 ("Merge tags 'free-mq_sysctls-for-v5.19' and
> 'ptrace_unfreeze_fix-for-v5.19' of
> git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace").
>
> just FYI.

Thanks for letting me know.  I took a quick look and everything appears
to be there so I don't have any complaints.

Trivial topic branches confusing bots since 2022 ;)

I have Cc'd Konstantin so he knows that octopus merges can confuse bots.

Eric
