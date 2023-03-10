Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ECBDAA5
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 19:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505E7C433EF;
	Fri, 10 Mar 2023 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678478374;
	bh=17eWZIf6Zo3HJ5aqJYOR5o3zIobLXfSkwC3zk0OyRNU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dOpNwn6iGe7hXT+bhA+V92cAnWo1ZN559oL6fvRKtxTXXngGwDaOUvmvjaCtBj/A2
	 zoYgeEE+uu3QCKhBWZO8FaykrEUq/PS68fKvw28WL3HnZfeQPdqXElBoVUZ9hOT4nO
	 fcv1yXFdr1UEZMwv0HvOphesKGA3rVkEcF4S1HDE=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
In-Reply-To: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
References: <20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com>
 <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
Subject: Re: [PATCH v2 0/4] ez: allow remote-tracking branches as
 ENROLL_BASE
Message-Id: <167847837421.175846.1491996657269939207.b4-ty@linuxfoundation.org>
Date: Fri, 10 Mar 2023 14:59:34 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-3f473


On Mon, 06 Mar 2023 13:02:08 -0500, Philippe Blain wrote:
> This is a more complete take at allowing remote-tracking branches
> as ENROLL_BASE in 'b4 prep --enroll'. The first commit is unchanged.
> 
> Changes in v2:
> - New patch to also check remote-tracking branches when ENROLL_BASE is
>   not a branch (2/4)
> - New patches (3/4-4/4) to support '@{u}'
> - Rebased on master
> - Link to v1: https://msgid.link/20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com
> 
> [...]

Applied, thanks!

[1/4] ez: allow remote-tracking branches as ENROLL_BASE
      commit: 800dae4b48fbbfb2bd52e0bc2da351b0627659b8
[2/4] ez: also check remote-tracking branches when ENROLL_BASE is not a branch
      commit: 6d27eef275c2b88663b446f156293a5c3c7ad7c6
[3/4] ez: allow '@{upstream}' as ENROLL_BASE
      commit: 1f34f802252976549d82338807c75729766653c6
[4/4] ez: let ENROLL_BASE default to '@{upstream}'
      commit: 800dae4b48fbbfb2bd52e0bc2da351b0627659b8

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

