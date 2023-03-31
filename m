Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AFA23BC
	for <tools@linux.kernel.org>; Fri, 31 Mar 2023 10:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14247C433EF;
	Fri, 31 Mar 2023 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680257058;
	bh=+2udPp50KWfVLF/WQ7mEayRBVz9Z61XyTO6now+zoME=;
	h=Date:From:To:Cc:Subject:From;
	b=ifaL01oa02NQhvxJW9+jZmVHOT8R+yRUvx/OKc2K0PVLEE4IyWcbYqmpHJOXK6sdH
	 vHCp824n1YOV+bbnALSYJZL1psOWPZfvYMTlo1CRAXVfYLnUbYmTW5PP5KODU6Hjtd
	 zt8KjJ3z/5qwk1Az/reU99Yjk/JNxNWEQP5HqNO2f6Ar5B83GTBuzvjF1y9fGxKtOn
	 +pxIGPBTRDEHYCChYf7bpkLn+ywl0n750Vip4Qi3X2Mm5mSKcPOI6tiS+JIAvJiqLI
	 HPOJBYuNdCvLpZo3bZAEyo8E7NNQm/7IBB0KVoC8CmxMDtkjEQp2WEesqq6jjGH87j
	 7ABIHibqDUxRw==
Date: Fri, 31 Mar 2023 12:04:14 +0200
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tools <tools@linux.kernel.org>
Subject: asdf
Message-ID: <20230331-ranged-decrease-6027cce938ff@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hey Konstantin,

Can't be said enough: thanks for b4!

I have two inquiries about b4 send:

(1) Currently the message id that is generated for each patch sent by b4
    has the format:

    [date] - [branch name] - [version] - [patch number] - [random] @ kernel.org

    where [date] is fixed and is taken from the change-id of the series
    as you mentioned in a fediverse thread.

    It would be nice if we could - potentially opt-in via a config opt -
    set [date] to the date when the patch series was sent.

(2) I couldn't find an option to tell b4 send to set In-Reply-To: to one
    or more messages. That comes in handy when e.g., generating a patch
    in reply to syzbot report.

Maybe that's something worth adding.

Thanks!
Christian
