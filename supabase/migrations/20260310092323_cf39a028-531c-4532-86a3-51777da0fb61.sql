
-- Allow users to update their own completed/auto_submitted attempts (for credibility score update)
DROP POLICY IF EXISTS "Users can update own in-progress attempts" ON public.exam_attempts;
CREATE POLICY "Users can update own attempts"
  ON public.exam_attempts
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id);
