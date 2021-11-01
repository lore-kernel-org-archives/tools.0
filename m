Received: from dcvr.yhbt.net (dcvr.yhbt.net [64.71.152.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C089A2C80;
	Mon,  1 Nov 2021 19:18:09 +0000 (UTC)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id EA5B61F953;
	Mon,  1 Nov 2021 19:09:05 +0000 (UTC)
Date: Mon, 1 Nov 2021 19:09:05 +0000
From: Eric Wong <e@80x24.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, git@vger.kernel.org
Subject: Re: b4: unicode control characters -- warn or remove?
Message-ID: <20211101190905.M853114@dcvr>
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> Hi, all:
> 
> Per exhibit a, what should we do in the situation where we discover unicode
> control characters in an email?
> 
> 1. Warn and strip these chars out, because they are extremely unlikely to be
>    doing anything legitimate in the context of a patch (unless someone is
>    sending patches for docs actually written in RTL languages)
> 2. Warn and error out, refusing to produce an mbox
> 3. Just warn and produce an mbox anyway
> 
> I'd normally do #3, but with many people piping things to git-am, I'm not sure
> if it's the safest choice.
> 
> Exibit a: https://lwn.net/Articles/874546/

+Cc: git@vger

IMHO, defense for this belongs in git-am (which already checks
things like whitespace).
