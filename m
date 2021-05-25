Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90992FAE
	for <tools@linux.kernel.org>; Tue, 25 May 2021 11:59:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 519756140F;
	Tue, 25 May 2021 11:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621943973;
	bh=85/Ytrj0iXphZqUYTXTHDJTymqMpfTU+Ry+S0zxFm/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jmOmkxf23xuwDDLtXrAmLeHOK/SlkZVbbhsDlZNxiMzd+EqsOrq9GMPhIahkoinCP
	 KM+Gyg2Q5EP7NayV4ofKxiN/QqRAkFD2kOM1KWk4MS144jiXDlzENC9JNwEpCfoz6f
	 VTA3C+H/c0wEGpEpFEADHWgMtel8HaduIB3kx8wU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org,
	Kyle Meyer <kyle@kyleam.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH b4] Avoid type error when local mbox lacks specified message ID
Date: Tue, 25 May 2021 07:59:12 -0400
Message-Id: <162194372635.531789.11103560582933548089.b4-ty@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523025812.26456-1-kyle@kyleam.com>
References: <20210523025812.26456-1-kyle@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=967; h=from:subject:message-id; bh=85/Ytrj0iXphZqUYTXTHDJTymqMpfTU+Ry+S0zxFm/4=; b=owGbwMvMwCG27YjM47CUmTmMp9WSGBLWPOuyzmWo3rhh8s4UJ4dP5//PsU+d6hMcctJmXYri6Yjd Ic5MHaUsDGIcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACZyqZyRYc2an2yRHo0nJszbb5GZ2J zQ0+F1xS5mqd60q095r6+dVsfwV2jRZX39e//atZeHhZ9Zm75b5Ot2TidpQ//l17fNKtxhzwoA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp; fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E
Content-Transfer-Encoding: 8bit

On Sat, 22 May 2021 22:58:12 -0400, Kyle Meyer wrote:
> Calling b4-am with --use-local=MBOX is supposed to abort with "Could
> not find MID in MBOX" if the mbox doesn't contain the specified
> message ID.  As of 4950093c0 (Don't use mboxo for anything,
> 2021-05-18), a type error is signaled because get_strict_thread()
> returns None when there are no matches, and get_msgs() feeds this
> result to len().
> 
> [...]

Applied, thanks!

[1/1] Avoid type error when local mbox lacks specified message ID
      commit: 5d6e3d8e47af6c787ca2cc32e873478fb5c3ba55

I should really refactor that part of the code to properly throw exceptions
instead of returning None. My head is a bit of a mishmash of "Python best
practices from 2003," back when throwing exceptions was considered "too slow."
I'm getting better, though -- who knows, I may even finally add a test suite.
:)

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
