Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B02572;
	Tue,  1 Jun 2021 20:13:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5529D61005;
	Tue,  1 Jun 2021 20:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1622578428;
	bh=8ztIr0kJZ0bDwW7hvWonUtV+I7iVM2e2Jbkw1BpHVKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdveyZEpVSylXYYY1MBbliOeu1/r+TuLCfGZBp3rnYmuWQaSfmGoXFdQtKQaoX1CR
	 eVjFAbyiKiFBg1Ge7lZBVXA6HFkn6fCLEzU8ir3WFmiHpTeGTJp9rQNgkG0NXOT2bp
	 5iecTThRMPvDDVCH3qvxCh8hjoWcFbBmz9j2ImGM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [PATCH] Fix cache aging cleanup of threads
Date: Tue,  1 Jun 2021 16:13:46 -0400
Message-Id: <162257835426.622841.9014502698126087963.b4-ty@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601200835.940887-1-robh@kernel.org>
References: <20210601200835.940887-1-robh@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=527; h=from:subject:message-id; bh=8ztIr0kJZ0bDwW7hvWonUtV+I7iVM2e2Jbkw1BpHVKo=; b=owGbwMvMwCG27YjM47CUmTmMp9WSGBK2TfnRNEXSsqyr9tm3+Z0+mxWc3LoeOqtLvVc6Pot5yg8T F23WjlIWBjEOBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABOZOYnhr2zRBc3YQMFvbQnxQav/P5 xv5/1653njaL1aj61HuE1mTGZkWJZrG+q5yfzWtRv67ZwiASZeAUs2zitSfsUf6hO2m9mUHwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp; fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E
Content-Transfer-Encoding: 8bit

On Tue, 1 Jun 2021 15:08:35 -0500, Rob Herring wrote:
> The cache aging for threads was not running resulting in failures to
> fetch new messages in threads. Fix the empty cache check which should
> be for no '.msgs' directories.

Ugh, thanks for finding that. Applied to both master and stable-0.7.y.
This is bad enough to roll a 0.7.1 soon.

[1/1] Fix cache aging cleanup of threads
      commit: b29c92d3e0a74024ce30c2eaf0cd6f9c5ca1fae9

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
