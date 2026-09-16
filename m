Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E53C1966
	for <tools@linux.kernel.org>; Wed, 16 Sep 2026 07:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542193; cv=none; b=dxYl8RQNplhTmzQMWsyMVoXD99rq5Y+WB9q98kHJBU04k0X+fmefnJW3nO1mqSc7xLENGRpQ7kTPvPINiQu1r8bPJIsAEAdSBRoPmLcZLGpbWwF5EKv9LBllBgjeEdUnlmzFeecK/YIMX+M1z3fIK+4MlQM+hh0kKWxDHLnr9LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542193; c=relaxed/simple;
	bh=1iHO7tmc9L5wnQyqKOkyvOv3oF2XRHVBaq9SSlyvYlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3YUDMcek4ddwEFIBP8n720y2dEPDhggPicevevAllXkmx0YE78s6RHtfKpUtnP4lCXwvbtikl77LXVzttpgwIKFJQLEgl8VoQ0QB34nsNyQeC8/LjiN/8z5G2J0jht0oYD7zhMOAu2qHfQKBvUX9QR0qZp79+slcYCxNEFPLFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItPJq1Wr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItPJq1Wr"
Received: by smtp.kernel.org (Postfix)
	id C835C1F00893; Wed, 16 Sep 2026 07:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A67C1F000FF;
	Wed, 16 Sep 2026 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789542191;
	bh=DWg6d/dfgy0iUIhzqKgADzA4DU187bft+I9VQsmgqh0=;
	h=From:To:Cc:Subject:Date;
	b=ItPJq1WrQ127ppRpZVr0HMG9cwHDBrS7SJkCWChMh7sBLaP/5sa3O7QugPbQiysSn
	 MD2jGMUAjs1lavcPYrcmMuBbj+z8Ve+Pb0FczehR0xRGkWdpYUwDcXQnM7P7XMFtb9
	 TGGXJ4XSnOf4m73DfQRUjXrFlEojK/hHMnZ4peBKc9Zz9VjVPIGwV/hvX4pLmqi9hB
	 dm3XnvCvgDJydDWJLMsptNhWijcsvB8vmqVJqE5UWevmZfTsVo7j1YLJEA4dKoebMN
	 bD/5nQpMeVu0hhE5Gv85TJkmjR/yxRZlXxGdPoQOYnbkyQTriSLlNd4Aa8Kg2Y9Eg4
	 NNdiXojSFkv0w==
From: Maxime Ripard <mripard@kernel.org>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] COPYING: Update to current FSF address and boilerplate
Date: Wed, 16 Sep 2026 09:03:06 +0200
Message-ID: <20260916070306.2361370-1-mripard@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The license file contained the FSF postal address at 51 Franklin
Street, which is no longer valid since the FSF moved out of that
office.  rpmlint flags this as incorrect-fsf-address.

Replace the street address with the current recommended GPL v2 text.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 COPYING | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/COPYING b/COPYING
index d159169d1050..9efa6fbc9628 100644
--- a/COPYING
+++ b/COPYING
@@ -1,10 +1,10 @@
                     GNU GENERAL PUBLIC LICENSE
                        Version 2, June 1991
 
  Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ <https://fsf.org/>
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
                             Preamble
 
@@ -302,12 +302,11 @@ the "copyright" line and a pointer to where the full notice is found.
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License along
-    with this program; if not, write to the Free Software Foundation, Inc.,
-    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+    with this program; if not, see <https://www.gnu.org/licenses/>.
 
 Also add information on how to contact you by electronic and paper mail.
 
 If the program is interactive, make it output a short notice like this
 when it starts in an interactive mode:
@@ -327,12 +326,12 @@ school, if any, to sign a "copyright disclaimer" for the program, if
 necessary.  Here is a sample; alter the names:
 
   Yoyodyne, Inc., hereby disclaims all copyright interest in the program
   `Gnomovision' (which makes passes at compilers) written by James Hacker.
 
-  <signature of Ty Coon>, 1 April 1989
-  Ty Coon, President of Vice
+  <signature of Moe Ghoul>, 1 April 1989
+  Moe Ghoul, President of Vice
 
 This General Public License does not permit incorporating your program into
 proprietary programs.  If your program is a subroutine library, you may
 consider it more useful to permit linking proprietary applications with the
 library.  If this is what you want to do, use the GNU Lesser General
-- 
2.55.0

